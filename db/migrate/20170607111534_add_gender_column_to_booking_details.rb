class AddGenderColumnToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :gender, :string, default: 'MR.'
  end
end
