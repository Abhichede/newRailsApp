$(function(){

    var capital_amount = 0;
    var interest_rate = 0;
    var total_payable_amount = 0;



    $("#investment_investment_amount").on('change focusout paste', function () {
       capital_amount = Number($(this).val());
       total_payable_amount = capital_amount ;

       $("#investment_total_payable_amount").val(total_payable_amount);

    });
    $("#investment_interest_rate").on('change focusout paste', function () {
        interest_rate = Number($(this).val());
        if(capital_amount == 0 ){
            alert("please enter capital amount");
        }else{
            var current_interest = ( interest_rate / 100 ) * capital_amount;
            total_payable_amount = capital_amount ;

            $("#investment_current_month_interest").val(current_interest);
            $("#investment_total_payable_amount").val(total_payable_amount);
        }

    });

    $("#investment_is_monthly_false").on('click', function () {
        $("#investments_hidden_fields").attr('class', '');
        $("#investments_interest_rate_div").attr('class', 'hidden');
    });
    $("#investment_is_monthly_true").on('click', function () {
        $("#investments_hidden_fields").attr('class', 'hidden');
        $("#investments_interest_rate_div").attr('class', 'form-group');
    });

    $("form#investment").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "investment[investment_date]": 'required',
            "investment[investment_amount]":{
                required: true,
                pattern:  /^([0-9]*[.])?[0-9]*$/
            },
            "investment[interest_rate]": {
                required: true,
                pattern:  /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "investment[investment_amount]":{
                required: "This is required Field",
                pattern: "Please enter valid Amount"
            },
            "investment[interest_rate]":{
                required: "This is required Field",
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