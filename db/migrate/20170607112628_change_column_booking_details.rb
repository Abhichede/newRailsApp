class ChangeColumnBookingDetails < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:booking_details, :gender, 'MR.')
  end
end
