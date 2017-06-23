$(function() {
    $("#departmentalLabourPaymentModal").on('shown.bs.modal', function () {
        var max_payable_amount = Number($("input#max_payable_amount").val());

        console.log("Max Amount " + max_payable_amount);

        $("input#dept_labour_payable_amount").on('focusout', function () {
            var currently_paying_amount = Number($("input#dept_labour_payable_amount").val());

            if (currently_paying_amount > max_payable_amount) {
                alert("you can not make payment more than 'TOTAL AMOUNT'.");
                $("#dept_pay_btn").attr('disabled', true);
            }
            else if(currently_paying_amount <= 0){
                alert("Amount should be greater than 0");
                $("#dept_pay_btn").attr('disabled', true);
            }
            else{
                $("#dept_pay_btn").attr('disabled', false);
            }
        });
    });
    $('#paymentDetailsModal').bind('hide', function () {
        $("#pay_det_tbody").replaceWith(' ');
    });

    $("form#departmental_labours-payment_form").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "amount":{
                required: true,
                pattern:  /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "amount":{
                required: "This is required Filed",
                pattern: "Please enter valid Amount"
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});

var department_labour_payment_details;

function department_labour_payment_details(){
   /* $(".dept_lab_pay_det").on('ajax:before', function (event, data, status) {
        show_spinner();
        console.log("Ajax Before ")
    });

    $(".dept_lab_pay_det").on('ajax:after', function (event, data, status) {
        hide_spinner();
        console.log("Ajax after ")
    });

    $(".dept_lab_pay_det").on('ajax:success', function (event, data, status) {
        alert("success");
    });
    $(".dept_lab_pay_det").on('ajax:error', function (event, data, status) {
        show_spinner();
        console.log("Ajax Error ")
    });*/
}
