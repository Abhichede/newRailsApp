class AddColumnToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :'booking_details.js', :paid_amount, :string
  end
end
