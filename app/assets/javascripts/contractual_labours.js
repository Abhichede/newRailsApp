$(function() {

    $("#contractual_labour_rate").on('change keyup paste', function () {
        var contractual_labour_quantity = $("input#contractual_labour_quantity").val();
        var contractual_labour_rate = $("input#contractual_labour_rate").val();

        if(contractual_labour_quantity == null || contractual_labour_quantity === 0 || contractual_labour_quantity === ''){
            alert("Please enter quantity to calculate amount");
        }else if(isNaN(contractual_labour_rate)){
            alert("Please enter Valid number");
        }
        else{
            var contractual_labour_rate = $("#contractual_labour_rate").val();
            $("#contractual_labour_amount").val(contractual_labour_rate * contractual_labour_quantity);
        }
    });

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.contractual_labour").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "contractual_labour[site_id]":{
                required: true
            },
            "contractual_labour[contractor_id]":{
                required: true
            },
            "contractual_labour[quantity]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "contractual_labour[rate]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "contractual_labour[amount]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "contractual_labour[quantity]":{
                pattern: "Please enter valid amount"
            },
            "contractual_labour[rate]":{
                pattern: "Please enter valid amount"
            },
            "contractual_labour[amount]":{
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