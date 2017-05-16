$(function() {
 var max_payable_amount = Number($("#max_payable_amount").val());

 $("input.currently_paying_amount").on('focusout', function () {
     var currently_paying_amount = Number($("input.currently_paying_amount").val());

     if(currently_paying_amount > max_payable_amount){
         alert("you can not make payment more than 'TOTAL AMOUNT', " +
             "if supplier owes extra payment then check for other sites.");
     }
 });
});