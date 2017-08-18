$(function () {
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