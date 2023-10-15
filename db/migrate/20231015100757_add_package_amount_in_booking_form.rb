class AddPackageAmountInBookingForm < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_forms, :package_amount, :integer
    add_column :booking_forms, :booking_cost_type, :string
  end
end
