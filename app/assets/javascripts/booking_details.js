var update_paid_amount_function = function () {

    $("#update-paid-amount-form").on('ajax:before', function (event, data, status) {
        show_spinner();
    });

    $("#update-paid-amount-form").on('ajax:after', function (event, data, status) {
        //hide_spinner();
    });

    $('#outward-lookup-form').on('ajax:success', function (event, data, status) {
        console.log("success");
    });
    $('#outward-lookup-form').on('ajax:error', function (event, xhr, status, error) {

        show_spinner();

    });
};