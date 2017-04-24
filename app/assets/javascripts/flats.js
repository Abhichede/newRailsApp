$(function() {

    $("#flat_govt_rate").on('change paste keyup', function () {
        var flat_area = $("#flat_area").val();

        if(flat_area == null){
            alert("Please enter flat area to calculate GOVT. Value");
        }else{
            var flat_govt_rate = $("#flat_govt_rate").val();
            $("#flat_govt_value").val(flat_govt_rate * flat_area);
        }
    });

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.flat").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "flat[flat_number]":"required",
            "flat[area]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "flat[floor]":"required",
            "flat[flat_cost]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "flat[govt_rate]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "flat[govt_value]":{
                required: true,
                pattern: /^[0-9]*$/
            },
            "flat[flat_type]":"required",
            "flat[wing]":"required",
            "flat[amenities]":"required"
        },
        // Specify validation error messages
        messages: {
            "flat[area]":{
                required: "This is required Filed, please enter value, don't put 'sqft'",
                pattern: "Please enter only number"
            },
            "flat[flat_cost]":{
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