$(function () {

    $("#investment_return_amount").on('focusout paste', function () {
       var investment_id = $("#investment_id").val();
       var total_payable_amount = Number($('#inv_total_payable_amount-'+investment_id).text());
       var paying_amount = Number($(this).val());

       console.log("total: "+total_payable_amount);
        console.log("paying: "+paying_amount);
        console.log('ID: '+ investment_id);

       if(paying_amount > total_payable_amount || paying_amount <= 0){
           $.notify(
               "amount should be less than or equal to total payable amount.",
               {style: 'bootstrap', className: 'error'}
           );

           $('#inv_return_save_btn').attr('disabled', true);
       }else{
           $('#inv_return_save_btn').attr('disabled', false);
       }
    });


    $("form.investor").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "investor[name]": 'required',
            "investor[address]": 'required',
            "investor[contact_number]":{
                required: true,
                pattern: /[0-9]{10}$/,
                minlength: 1,
                maxlength: 10
            },
            "investor[email]": 'required'
        },
        // Specify validation error messages
        messages: {
            "investor[contact_number]":{
                required: "This is required Field",
                pattern: "Please enter valid Phone"
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});