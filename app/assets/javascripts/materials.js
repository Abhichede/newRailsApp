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

    if($("#material_is_gst_true").is(':checked')){
       $("#gst-rate").attr('class', '');
       $("#material_gst_rate").val('6');
    }else{
        $("#gst-rate").attr('class', 'hidden');
        $("#material_gst_rate").val('0');
    }

    $("#material_is_gst_true").on('click', function () {
        $("#gst-rate").attr('class', '');
        $("#material_gst_rate").val('6');
    });
    $("#material_is_gst_false").on('click', function () {
        $("#gst-rate").attr('class', 'hidden');
        $("#material_gst_rate").val('0');
    });

    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form.material").validate({
        debug: true,
        // Specify validation rules
        rules: {
            "material[site_id]":{
                required: true
            },
            "material[supplier_id]":{
                required: true
            },
            "material[type_of_material]":{
                required: true
            },
            "material[quantity]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "material[rate]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            },
            "material[amount]":{
                pattern: /^([0-9]*[.])?[0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "material[quantity]":{
                pattern: "Please enter valid amount"
            },
            "material[rate]":{
                pattern: "Please enter valid amount"
            },
            "material[amount]":{
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