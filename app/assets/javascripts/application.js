// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require hermitage
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require bootstrap-multiselect
// require bootstrap-material-design
// require turbolinks
//= require booking_details
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .

$(document).ready(function () {

    update_paid_amount_function();
    search_customer_function();
    schedule_next_installment_function();
    department_labour_payment_details();
    off();
    $("form").on('submit', function () {
        if($(this).valid()){
            on();
        }else {
            off();
        }

    });

    setInterval(blinker, 1000);
});

var hide_spinner = function () {
    $("#spinner").hide();
};


var show_spinner = function () {
    $("#spinner").show();
};

function on() {
    $("#__overlay").css('display', 'block');
}

function off() {
    $("#__overlay").css('display', "none");
}

function blinker() {
    $('.blink_me').fadeOut(500);
    $('.blink_me').fadeIn(500);
}

