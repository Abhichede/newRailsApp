class AlterColumnToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    change_column :booking_details, :loan_possible, :string
  end
end
