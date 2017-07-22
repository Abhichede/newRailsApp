$(function() {

    $("#flat_govt_value").on('change keyup paste', function () {
        var flat_area = $("input#flat_area").val();

        if(flat_area == null || flat_area === 0 || flat_area === ''){
            alert("Please enter flat area to calculate GOVT. Value");
        }else{
            var flat_govt_value = $("#flat_govt_value").val();
            $("#flat_govt_rate").val(flat_govt_value / flat_area);
        }
    });
    $("#flat_flat_cost").on('change paste keyup', function () {
        var flat_area = $("input#flat_area").val();

        if(flat_area == null || flat_area === 0 || flat_area === ''){
            alert("Please enter flat area to calculate FLAT Value");
        }else{
            var flat_govt_cost = $("#flat_flat_cost").val();
            $("#flat_flat_rate").val(flat_govt_cost / flat_area);
        }
    });

    $("#flat_flat_number, #flat_wing").on('focusout', function () {
       var wing_number = $("#flat_wing").val();
        // console.log(wing_number);
       if($("#flat_flat_number").val() === ''){

       } else {
           if ($("#flat_flat_number").val().indexOf(wing_number)) {
               $.notify('Flat number should contain exact selected wing number', {className: 'error'});
               $("label[for=flat_wing][class=error]").text('Flat number should contain exact selected wing number');
               $("#flat-save-btn").attr('disabled', true)
           } else {
               $("#flat-save-btn").attr('disabled', false)
           }
       }
    });

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.flat").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "flat[flat_number]":{
                required: true,
                pattern: /^([A-Z]{1})?[-][0-9]{1,4}$/
            },
            "flat[area]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "flat[floor]":"required",
            "flat[flat_cost]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "flat[flat_rate]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "flat[govt_rate]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "flat[govt_value]":{
                required: true,
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "flat[flat_type]":"required",
            "flat[wing]":"required",
            "flat[amenities]":"required"
        },
        // Specify validation error messages
        messages: {
            "flat[flat_number]":{
                required: "This is required Filed",
                pattern: "Please enter in format (wing-number). eg A-101"
            },
            "flat[area]":{
                required: "This is required Filed, please enter value, don't put 'sqft'",
                pattern: "Please enter only number"
            },
            "flat[flat_cost]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[flat_rate]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[govt_rate]":{
                required: "This is required filed, Please fill with this proper value",
                pattern: "Please enter valid amount"
            },
            "flat[govt_value]":{
                required: "This is required filed, Please fill with this proper value",
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