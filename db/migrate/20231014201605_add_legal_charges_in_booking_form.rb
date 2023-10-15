class AddLegalChargesInBookingForm < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_forms, :legal_charges, :integer
  end
end
