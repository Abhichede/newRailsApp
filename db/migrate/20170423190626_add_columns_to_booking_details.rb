class AddColumnsToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :water_charges, :string
    add_column :booking_details, :parking_charges, :string
    add_column :booking_details, :maintenance_charges, :string
    add_column :booking_details, :govt_charges, :string
  end
end
