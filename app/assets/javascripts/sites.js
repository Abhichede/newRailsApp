$(function() {

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.flat").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "site[name]":"required",
            "site[address]":{
                required: true,
                pattern: /^(\w*\s*[\#\-\,\/\.\(\)\&]*)+\s[0-9]{6}$/
            },
            "site[type_of_structures]":"required",
            "site[no_of_units]":{
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
            "site[no_of_units]":{
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
});
