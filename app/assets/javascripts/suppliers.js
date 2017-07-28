$(function() {
 var max_payable_amount = Number($("#max_payable_amount").val());

 $("input.currently_paying_amount").on('focusout', function () {
     var currently_paying_amount = Number($("input.currently_paying_amount").val());

     if(currently_paying_amount > max_payable_amount){
         alert("you can not make payment more than 'TOTAL AMOUNT', " +
             "if supplier owes extra payment then check for other sites.");
         $("#suppliers-payment-save-btn").attr('disabled', true);
     }else{
         $("#suppliers-payment-save-btn").attr('disabled', false);
     }
 });

    $("form.supplier").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "supplier[contact_number]":{
                required: true,
                pattern: /[0-9]{10}$/,
                minlength: 1,
                maxlength: 10
            }
        },
        // Specify validation error messages
        messages: {
            "supplier[contact_number]": "Please enter 10 digit mobile number"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});