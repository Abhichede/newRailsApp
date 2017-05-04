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

    $("#booking_detail_loan_possible").on("change", function () {
       var is_loan_possible = $("#booking_detail_loan_possible").val();
       if(is_loan_possible == '1'){
           $("#loan-possible-div").attr('class', ' ');
       }else if(is_loan_possible == '0'){
           $("#loan-possible-div").attr('class', 'hidden');
           $("#booking_detail_name_of_bank").attr('value', 'NA');
           $("#booking_detail_branch_of_bank").attr('value', 'NA');
           $("#booking_detail_sanctioned_amount").attr('value', '0');
           $("#booking_detail_employee_name").attr('value', 'NA');
       }
    });
    var pre_balance_amount = Number($("#booking_detail_balance_amount").val());

    $("#booking_detail_water_charges,#booking_detail_MSEB_charges,#booking_detail_parking_charges," +
        "#booking_detail_maintenance_charges,#booking_detail_agreement_cost,#booking_detail_other_charges").on("change", function () {

        var water_charges = Number($("#booking_detail_water_charges").val());
        var parking_charges = Number($("#booking_detail_parking_charges").val());
        var MSEB_charges = Number($("#booking_detail_MSEB_charges").val());
        var maintenance_charges = Number($("#booking_detail_maintenance_charges").val());
        var agreement_cost = Number($("#booking_detail_agreement_cost").val());
        var other_charges = Number($("#booking_detail_other_charges").val());

        var stamp_duty = Number($("#booking_detail_stamp_duty").val());
        var registration_fees = Number($("#booking_detail_registration_fees").val());
        var vat = Number($("#booking_detail_vat").val());
        var service_tax = Number($("#booking_detail_service_tax").val());
        var lbt = Number($("#booking_detail_lbt").val());
        var legal_charges = Number($("#booking_detail_legal_charges").val());

        var balance_amount = water_charges + parking_charges + MSEB_charges + maintenance_charges +
                agreement_cost + other_charges + stamp_duty + registration_fees + vat + service_tax +
                lbt + legal_charges;




        $("#booking_detail_final_sale_deed").attr('value', pre_balance_amount + balance_amount);
    });

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
                pattern: /^[\w]{3}(p|P|c|C|h|H|f|F|a|A|t|T|b|B|l|L|j|J|g|G)[\w][\d]{4}[\w]$/
            },
            "booking_detail[customer_adhar]":{
                required: true,
                pattern: /[0-9]{12}$/,
                maxlength: 12
            },
            "booking_detail[vat]":{
                required: true
            },
            "booking_detail[service_tax]":{
                required: true
            },
            "booking_detail[agreement_cost]":{
                required: true
            },
            "booking_detail[registration_fees]":{
                required: true
            },
            "booking_detail[final_sale_deed_fees]":{
                required: true
            },
            "booking_detail[stamp_duty]":{
                required: true
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
            "booking_detail[other_charges]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[token_amount]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "booking_detail[payment_desc]":{
                required: true
            },
            "booking_detail[name_of_bank]":{
                required: true
            },
            "booking_detail[branch]":{
                required: true
            },
            "booking_detail[employee_name]":{
                required: true
            },
            "booking_detail[sanctioned_amount]":{
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
            },
            "booking_detail[token_amount]":{
                required: "Please enter token amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[sanctioned_amount]":{
                required: "Please enter sanctioned amount",
                pattern: "please enter valid amount"
            },
            "booking_detail[payment_desc]":{
                required: "Please enter payment Description"
            }


        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});