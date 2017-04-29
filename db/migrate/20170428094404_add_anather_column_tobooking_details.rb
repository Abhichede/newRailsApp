class AddAnatherColumnTobookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :payment_type, :string
    add_column :booking_details, :payment_desc, :string
  end
end
