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
    var amountToShowInWords = document.getElementsByClassName('amount-to-be-shown-in-words')
    for (let index = 0; index < amountToShowInWords.length; index++) {
        const numberField = amountToShowInWords[index];
        if (numberField) {
            numberField.addEventListener("input", function () {
                $(numberField).next()[0].innerHTML = inWords(numberField.value);
            });
        }
    }
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



var a = ['', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ', 'Eighteen ', 'Nineteen '];
var b = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

function inWords(num) {
    if ((num = num.toString()).length > 9) return 'overflow';
    n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
    if (!n) return; var str = '';
    str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'Crore ' : '';
    str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'Lakh ' : '';
    str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'Thousand ' : '';
    str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'Hundred ' : '';
    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + "Rupees" : '';
    return str;
}