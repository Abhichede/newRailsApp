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
            var total_amount = contractual_labour_rate * contractual_labour_quantity;
            var gst_rate = Number($("#contractual_gst_rate").val());
            var tds_rate = Number($("#contractual_tds_rate").val());

            $("#contractual_labour_amount").val(total_amount);
            $("#contractual_gst_cost").val(total_amount * (gst_rate / 100));
            $("#contractual_tds_cost").val(total_amount * (tds_rate / 100));
        }
    });

    $("#contractual_gst_rate").on('change keyup click', function () {
       var total_amount = Number($("#contractual_labour_amount").val());
       var gst_rate = Number($(this).val());

       $("#contractual_gst_cost").val(total_amount * (gst_rate / 100));

    });
    $("#contractual_tds_rate").on('change keyup click', function () {
        var total_amount = Number($("#contractual_labour_amount").val());
        var tds_rate = Number($(this).val());

        $("#contractual_tds_cost").val(total_amount * (tds_rate / 100));

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