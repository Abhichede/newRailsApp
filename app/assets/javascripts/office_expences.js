$(function() {

    $("#material_rate").on('change keyup paste', function () {
        var material_quantity = $("input#material_quantity").val();

        if(material_quantity == null || material_quantity === 0 || material_quantity === ''){
            alert("Please enter quantity to calculate amount");
        }else{
            var material_rate = $("#material_rate").val();
            $("#material_amount").val(material_rate * material_quantity);
        }
    });

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.office_expense").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "office_expense[payment_method]":{
                required: true
            },
            "office_expense[description]":{
                required: true
            },
            "office_expense[date]":{
                required: true
            },
            "office_expense[payment_to]":{
                required: true
            },
            "office_expense[payment_desc]":{
                required: true
            },
            "office_expense[amount]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "office_expense[amount]":{
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