var update_paid_amount_function = function () {

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
var schedule_next_installment_function = function () {

    $("#schedule-next-installment-form").on('ajax:before', function (event, data, status) {
        show_spinner();
    });

    $("#schedule-next-installment-form").on('ajax:after', function (event, data, status) {
        //hide_spinner();
        console.log("After");
    });

    $('#schedule-next-installment-form').on('ajax:success', function (event, data, status) {
        console.log("success");
    });
    $('#schedule-next-installment-form').on('ajax:error', function (event, xhr, status, error) {

        console.log("Error");
        show_spinner();

    });
};

$(function() {


    var is_loan_possible = $("#booking_detail_loan_possible").val();
    var is_gst = true;
    var stamp_duty_val = 5;

    if($("#booking_detail_is_gst_true").is(':checked')){
        is_gst = true;
        $("#non-gst-taxes").attr('class', 'hidden');
        $("#gst-taxes").attr('class', ' ');
        $("#stamp_duty_select").val("6")
    }else {
        is_gst = false;
        $("#non-gst-taxes").attr('class', ' ');
        $("#gst-taxes").attr('class', 'hidden');
        $("#stamp_duty_select").val("5")
    }

    $("#booking_detail_is_gst_true").on('click', function () {
        is_gst = true;
        $("#non-gst-taxes").attr('class', 'hidden');
        $("#gst-taxes").attr('class', ' ');
        $("#stamp_duty_select").val("6");
        stamp_duty_val = Number($("#stamp_duty_select").val());
        $("#booking_detail_stamp_duty").attr('value', (stamp_duty_val/100)*Number($("#booking_detail_agreement_cost").val()));
    });
    $("#booking_detail_is_gst_false").on('click', function () {
        is_gst = false;
        $("#non-gst-taxes").attr('class', ' ');
        $("#gst-taxes").attr('class', 'hidden');
        $("#stamp_duty_select").val("5");
        stamp_duty_val = Number($("#stamp_duty_select").val());
        $("#booking_detail_stamp_duty").attr('value', (stamp_duty_val/100)*Number($("#booking_detail_agreement_cost").val()));
    });

    if(is_loan_possible === 'Yes'){
        $("#loan-possible-div").attr('class', ' ');
    }else if(is_loan_possible === 'No'){
        $("#loan-possible-div").attr('class', 'hidden');
        $("#booking_detail_name_of_bank").attr('value', 'NA');
        $("#booking_detail_branch_of_bank").attr('value', 'NA');
        $("#booking_detail_sanctioned_amount").attr('value', '0');
        $("#booking_detail_employee_name").attr('value', 'NA');
    }

    $("#booking_detail_loan_possible").on("change", function () {
       var is_loan_possible = $("#booking_detail_loan_possible").val();
       if(is_loan_possible == 'Yes'){
           $("#loan-possible-div").attr('class', ' ');
       }else if(is_loan_possible == 'No'){
           $("#loan-possible-div").attr('class', 'hidden');
           $("#booking_detail_name_of_bank").attr('value', 'NA');
           $("#booking_detail_branch_of_bank").attr('value', 'NA');
           $("#booking_detail_sanctioned_amount").attr('value', '0');
           $("#booking_detail_employee_name").attr('value', 'NA');
       }
    });
    $("#booking_detail_agreement_cost").on("change keyup", function () {
        var agreement_cost = Number($("#booking_detail_agreement_cost").val());
        stamp_duty_val = Number($("#stamp_duty_select").val());

        $("#booking_detail_stamp_duty").attr('value', Number((stamp_duty_val/100)*agreement_cost));
        $("#booking_detail_registration_fees").attr('value', (1/100)*agreement_cost);
        $("#booking_detail_vat").attr('value', (1/100)*agreement_cost);
        $("#booking_detail_service_tax").attr('value', (4.52/100)*agreement_cost);
        $("#booking_detail_lbt").attr('value', 0);
        var gst_rate = Number($("#booking_detail_gst_rate").val());

        $("#booking_detail_gst_cost").attr('value', (gst_rate/100)*agreement_cost);

    });

    $("#stamp_duty_select").on("change", function () {
        var agreement_cost = Number($("#booking_detail_agreement_cost").val());
        stamp_duty_val = Number($("#stamp_duty_select").val());
        $("#booking_detail_stamp_duty").attr('value', Number((stamp_duty_val/100)*agreement_cost));
    });

    $("#maintenance_in_sqft").on('focusout', function () {

       var flat_area = Number($("#booking_detail_flat_area").val());
       var maintenance_charges = Number($("#maintenance_in_sqft").val());
        console.log('Maintenance '+ flat_area * maintenance_charges);
        $("#booking_detail_maintenance_charges").attr('value', flat_area * maintenance_charges);

    });

    $("#booking_detail_water_charges,#booking_detail_MSEB_charges,#booking_detail_parking_charges," +
        "#booking_detail_other_charges,#booking_detail_stamp_duty,#booking_detail_maintenance_charges" +
        ",#booking_detail_registration_fees,#booking_detail_vat,#booking_detail_service_tax,#booking_detail_lbt," +
        "#booking_detail_legal_charges,#booking_detail_flat_cost, #booking_detail_gst_rate, " +
        "#booking_detail_is_gst_false, #booking_detail_is_gst_true").on("change keyup", function () {

        var water_charges = Number($("#booking_detail_water_charges").val());
        var parking_charges = Number($("#booking_detail_parking_charges").val());
        var MSEB_charges = Number($("#booking_detail_MSEB_charges").val());
        var maintenance_charges = Number($("#booking_detail_maintenance_charges").val());
        var other_charges = Number($("#booking_detail_other_charges").val());

        var pre_balance_amount = Number($("#booking_detail_flat_cost").val());
        var agreement_cost = Number($("#booking_detail_agreement_cost").val());

        if($("#booking_detail_is_gst_true").is(':checked')){
            var gst_rate = $("#booking_detail_gst_rate").val();
            var stamp_duty = Number($("#booking_detail_stamp_duty").val());
            var registration_fees = Number($("#booking_detail_registration_fees").val());
            var legal_charges = Number($("#booking_detail_legal_charges").val());
            $("#booking_detail_gst_cost").attr('value', (gst_rate/100)*agreement_cost);

            var gst_cost = Number($("#booking_detail_gst_cost").val());

           var balance_amount = pre_balance_amount + water_charges + MSEB_charges + parking_charges + maintenance_charges +
                    other_charges + stamp_duty + registration_fees + legal_charges + gst_cost;

            $("#booking_detail_final_sale_deed").attr('value', balance_amount);

        }else{
            var vat = Number($("#booking_detail_vat").val());
            var service_tax = Number($("#booking_detail_service_tax").val());
            var lbt = Number($("#booking_detail_lbt").val());
            var stamp_duty = Number($("#booking_detail_stamp_duty").val());
            var registration_fees = Number($("#booking_detail_registration_fees").val());
            var legal_charges = Number($("#booking_detail_legal_charges").val());

           var balance_amount = pre_balance_amount + water_charges + MSEB_charges + parking_charges + maintenance_charges +
                other_charges + stamp_duty + registration_fees + legal_charges + vat + service_tax + lbt;

            $("#booking_detail_final_sale_deed").attr('value', balance_amount);
        }
    });

    $("#booking_detail_token_amount").on('focusout', function () {
        var final_sale_deed = Number($("#booking_detail_final_sale_deed").val());
        var token_amount_entered = Number($(this).val());

        if(token_amount_entered > final_sale_deed ){
            $.notify('Token should be less than final sell deed', {className: 'error'});
            $("#booking_detail_final_sale_deed").focus();
            $("#booking-save-btn").attr('disabled', true);
        }else{
            $("#booking-save-btn").attr('disabled', false);
        }

    });

    var previous_payable_amount = 0;

    $("#edit-customer-payable-amount").on('click', function () {
       previous_payable_amount = Number($(this).val());
    });

    $("#edit-customer-payable-amount").on('focusout', function () {
       var payment_balance_amount =  Number($("#pay-balance-amount").text()) + previous_payable_amount;
       var entered_amount = Number($(this).val());

       console.log('Balance amount '+ payment_balance_amount);

       if(entered_amount > payment_balance_amount || entered_amount == 0){
           $.notify('Amount should not be greater than balance amount, \n or amount should not be 0', {className: 'error'});

           $("#save-paid-amount").attr('disabled', true);
       }else{
           $("#save-paid-amount").attr('disabled', false);
       }
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
                required: true
            },
            "booking_detail[customer_pan]":{
                required: true,
                pattern: /^[A-Z]{3}(P|C|H|F|A|T|B|L|J|G)[\w][\d]{4}[A-Z]$/
            },
            "booking_detail[customer_adhar]":{
                required: true,
                pattern: /[0-9]{12}$/,
                maxlength: 12
            },
            "booking_detail[vat]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[service_tax]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[agreement_cost]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[registration_fees]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[final_sale_deed_fees]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[stamp_duty]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[legal_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[MSEB_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[water_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[parking_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[maintenance_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[other_charges]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[token_amount]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
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
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "booking_detail[loan_possible]":"required"
        },
        // Specify validation error messages
        messages: {
            "booking_detail[customer_name]": "Please enter customer Name",
            "booking_detail[customer_contact]": "Please enter 10 digit mobile number",
            "booking_detail[customer_address]": {
                required: "Please enter customer address"
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
            "booking_detail[legal_charges]": {
                required: "Please enter legal charges",
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

    $('#booking_detail_agreement_cost').on('change keyup paste', function () {
        var entered_number = $('#booking_detail_agreement_cost').val();
        var string_number = numberWithCommas(entered_number);
        console.log(string_number);
    });
    var balance_amount = Number($("#customer-balance-amount").text());
    $("#customer-payable-amount").on('focusout', function () {
       var payable_amount = Number($("#customer-payable-amount").val());
        console.log(balance_amount);
       if(payable_amount > balance_amount || payable_amount == 0 ){
           $.notify("amount must be less than balance amount and greater than 0",
               {className: "error"});
           $("#save-paid-amount").attr('disabled', true);
       }else{
           $("#save-paid-amount").attr('disabled', false);
       }

    });
});
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}