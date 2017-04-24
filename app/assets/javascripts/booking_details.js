var update_paid_amount_function = function () {

    console.log("Paid Amount");
    $("#update-paid-amount-form").on('ajax:before', function (event, data, status) {
        show_spinner();
        console.log("Before");
    });

    $("#update-paid-amount-form").on('ajax:after', function (event, data, status) {
        //hide_spinner();
        console.log("After");
    });

    $('#outward-lookup-form').on('ajax:success', function (event, data, status) {
        console.log("success");
    });
    $('#outward-lookup-form').on('ajax:error', function (event, xhr, status, error) {

        console.log("Error");
        show_spinner();

    });
};
var search_customer_function = function () {

    $("#customer_search_form").on('ajax:before', function (event, data, status) {
        show_spinner();
        console.log("Before");
    });

    $("#customer_search_form").on('ajax:after', function (event, data, status) {
        //hide_spinner();
        console.log("After");
    });

    $('#customer_search_form').on('ajax:success', function (event, data, status) {
        console.log("success");
    });
    $('#customer_search_form').on('ajax:error', function (event, xhr, status, error) {

        console.log("Error");
        show_spinner();

    });
};

$(function() {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.booking_detail").validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "booking_detail[customer_name]": {required: true},
            "booking_detail[customer_contact]": {
                required: true,
                pattern: /[0-9]{10}$/,
                minlength: 1,
                maxlength: 10
            },
            "booking_detail[customer_address]":{
                required: true,
                pattern: /^(\w*\s*[\#\-\,\/\.\(\)\&]*)+\s[0-9]{6}$/
            },
            "booking_detail[customer_pan]":{
                required: true,
                pattern: /[A-Za-z]{5}\d{4}[A-Za-z]{1}$/
            },
            "booking_detail[customer_adhar]":{
                required: true,
                pattern: /[0-9]{12}$/,
                maxlength: 12
            },
            "booking_detail[booking_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[vat]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[service_tax]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[agreement_cost]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[registration_fees]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[final_sale_deed_fees]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[stamp_duty]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[MSEB_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[water_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[parking_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[maintenance_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[govt_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[other_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[loan_possible]":"required"
        },
        // Specify validation error messages
        messages: {
            "booking_detail[customer_name]": "Please enter customer Name",
            "booking_detail[customer_contact]": "Please enter 10 digit mobile number",
            "booking_detail[customer_address]": {
                required: "Please enter customer address",
                pattern: "Invalid Address, Make sure you entered correct 6 digit PIN"
            },
            "booking_detail[customer_pan]":{
                required: "Please enter customer PAN",
                pattern: "Make sure you entered valid PAN ex: AZRPC9806E"
            },
            "booking_detail[customer_adhar]":{
                required: "Please enter customer ADHAR number",
                pattern: "Make sure you entered valid ADHAR(only 12 digits) ex: 895965218563"
            },
            "booking_detail[booking_charges]": {
                required: "Please enter booking amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[vat]": {
                required: "Please enter VAT amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[service_tax]": {
                required: "Please enter Service tax amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[agreement_cost]": {
                required: "Please enter Agreement cost amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[registration_fees]": {
                required: "Please enter Registration fees amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[final_sale_deed_fees]": {
                required: "Please enter Final sale deed amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[stamp_duty]": {
                required: "Please enter stamp duty amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[MSEB_charges]": {
                required: "Please enter MSEB Charges",
                pattern: "please enter valid amount"
            },
            "booking_detail[water_charges]": {
                required: "Please enter water charges",
                pattern: "please enter valid amount"
            },
            "booking_detail[parking_charges]": {
                required: "Please enter parking charges",
                pattern: "please enter valid amount"
            },
            "booking_detail[maintenance_charges]": {
                required: "Please enter Maintenance charges",
                pattern: "please enter valid amount"
            },
            "booking_detail[govt_charges]": {
                required: "Please enter GOVT. charges",
                pattern: "please enter valid amount"
            },
            "booking_detail[other_charges]": {
                required: "Please enter Other amount",
                pattern: "please enter valid amount"
            }


        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});