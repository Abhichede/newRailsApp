$(function() {

    if ($('#filter-supplier').length) {
        $('#filter-supplier').selectpicker({liveSearch: true});
    }

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.site").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "site[name]":"required",
            "site[address]":{
                required: true,
                pattern: /^(\w*\s*[\#\-\,\/\.\(\)\&]*)+\s[0-9]{6}$/
            },
            "site[type_of_structures]":"required",
            "site[no_of_flats]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "site[no_of_shops]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "site[area_of_plot]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "site[project_approved_by]":{
                required: true
            }
        },
        // Specify validation error messages
        messages: {
            "site[address]":{
                required: "This is required Filed",
                pattern: "Please enter valid Address with 6 digit PIN CODE"
            },
            "site[no_of_flats]":{
                required: "This is required filed",
                pattern: "Please enter valid amount"
            },
            "site[no_of_shops]":{
                required: "This is required filed",
                pattern: "Please enter valid amount"
            },
            "site[area_of_plot]":{
                required: "This is required filed",
                pattern: "Please enter valid amount"
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
    var no_of_shops = $("#site_no_of_shops").val();
    if ($("#site_site_type").val() === 'Residential'){
        $("#site_no_of_shops").attr('value', 0);
        $("#site_no_of_shops").attr('readonly', true);
    }else{
        $("#site_no_of_shops").attr('value', no_of_shops);
        $("#site_no_of_shops").attr('readonly', false);
    }
    $("#site_site_type").on('change focusout', function () {
        if ($(this).val() === 'Residential'){
            $("#site_no_of_shops").attr('value', 0);
            $("#site_no_of_shops").attr('readonly', true);
        }else{
            $("#site_no_of_shops").attr('value', no_of_shops);
            $("#site_no_of_shops").attr('readonly', false);
        }
    });

});

// Chip search: bindings live outside document.ready so they always use delegation.
function getChipSearchContainer($searchInput) {
    // Desktop tabs use .tab-pane; mobile accordion (fakewaffle.responsiveTabs) removes it
    // and uses .fw-previous-tab-pane on the moved panel body instead.
    var $container = $searchInput.closest('.tab-pane, .fw-previous-tab-pane');
    if (!$container.length) {
        $container = $searchInput.closest('.jumbotron[id]');
    }
    return $container;
}

function filterSiteTabChips($searchInput) {
    var query = $.trim($searchInput.val()).toLowerCase();
    var $container = getChipSearchContainer($searchInput);

    $container.find('.site-chip-item').each(function() {
        var text = $.trim($(this).text()).toLowerCase();
        var matches = query === '' || text.indexOf(query) !== -1;
        $(this).toggle(matches);
    });
}

function scheduleFilterSiteTabChips($searchInput) {
    window.requestAnimationFrame(function() {
        filterSiteTabChips($searchInput);
    });
}

function runChipSearchFromButton($btn) {
    var $input = $btn.closest('.site-chip-search-wrap').find('.site-chip-search');
    filterSiteTabChips($input);
    $input.blur();
}

$(document).on('input keyup paste search', '.site-chip-search', function() {
    scheduleFilterSiteTabChips($(this));
});

$(document).on('change blur', '.site-chip-search', function() {
    filterSiteTabChips($(this));
});

$(document).on('keydown', '.site-chip-search', function(e) {
    if (e.which === 13 || e.keyCode === 13) {
        e.preventDefault();
        filterSiteTabChips($(this));
        $(this).blur();
    }
});

var chipSearchButtonTouchHandled = false;

$(document).on('touchend', '.site-chip-search-btn', function(e) {
    e.preventDefault();
    chipSearchButtonTouchHandled = true;
    runChipSearchFromButton($(this));
    var btn = this;
    setTimeout(function() {
        if (chipSearchButtonTouchHandled && document.activeElement === btn) {
            chipSearchButtonTouchHandled = false;
        }
    }, 400);
});

$(document).on('click', '.site-chip-search-btn', function(e) {
    e.preventDefault();
    e.stopPropagation();
    if (chipSearchButtonTouchHandled) {
        chipSearchButtonTouchHandled = false;
        return false;
    }
    runChipSearchFromButton($(this));
});

$(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function() {
    var target = $(this).attr('href');
    $(target).find('.site-chip-search').each(function() {
        filterSiteTabChips($(this));
    });
});

$(document).on('shown.bs.collapse', '.panel-group.responsive .panel-collapse', function() {
    $(this).find('.site-chip-search').each(function() {
        filterSiteTabChips($(this));
    });
});
