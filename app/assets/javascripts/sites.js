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

    function filterSiteTabChips($searchInput) {
        var query = $.trim($searchInput.val()).toLowerCase();
        var $tabPane = $searchInput.closest('.tab-pane');

        $tabPane.find('.site-chip-item').each(function() {
            var text = $.trim($(this).text()).toLowerCase();
            var matches = query === '' || text.indexOf(query) !== -1;
            $(this).toggle(matches);
        });
    }

    $(document).on('input keyup', '.site-chip-search', function() {
        filterSiteTabChips($(this));
    });

    $('a[data-toggle="tab"]').on('shown.bs.tab', function() {
        var target = $(this).attr('href');
        $(target).find('.site-chip-search').each(function() {
            filterSiteTabChips($(this));
        });
    });
});
