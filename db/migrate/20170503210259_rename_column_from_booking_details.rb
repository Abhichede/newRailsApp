class RenameColumnFromBookingDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :booking_details, :balance_amount, :final_sale_deed
  end
end
