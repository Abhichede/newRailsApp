// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function(){
  $("#partner_debit_table, #partner_credit_table").dataTable({
    'pageLength': 10,
    "order": [[ 0, "desc" ]],
    drawCallback: function () {
      var api = this.api();
      total = 0
      data = api
        .column(1, { search: "applied" })
        .data()
        .sum();
      $(api.table().footer()).html(
        "<td><strong>Total: </strong></td><td colspan='2'><strong>₹ " +
          data.toLocaleString() +
          "</strong></td><td colspan='3'></td>"
      );
    }
  });
});