class AddColumnBalanceAmountToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :balance_amount, :string
  end
end
