$(function() {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form#new_partner_payment").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "partner_payment[payment_method]":{
                required: true
            },
            "partner_payment[date]":{
                required: true
            },
            "office_expence[payment_desc]":{
                required: true
            },
            "office_expence[amount]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "partner_payment[amount]":{
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