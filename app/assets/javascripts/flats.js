$(function() {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.flat").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "flat[flat_number]":"required",
            "flat[area]":"required",
            "flat[floor]":"required",
            "flat[flat_cost]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[MSEB_charges]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[other_charges]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[water_charges]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[parking_charges]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[maintainance_charges]":{
                required: true,
                pattern: /[0-9]/
            },
            "flat[govt_charges]":{
                required: true,
                pattern: /[0-9]/
            }
        },
        // Specify validation error messages
        messages: {
            "flat[flat_cost]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[MSEB_charges]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[other_charges]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[water_charges]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[parking_charges]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[maintainance_charges]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[govt_charges]":{
                required: "This is required filed, Please fill with this proper value",
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