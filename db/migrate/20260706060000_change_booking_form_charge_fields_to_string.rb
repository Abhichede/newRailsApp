class ChangeBookingFormChargeFieldsToString < ActiveRecord::Migration[5.0]
  def up
    change_column :booking_forms, :apartment_declaration, :string
    change_column :booking_forms, :infrastructure_and_development, :string
    change_column :booking_forms, :other_charges, :string
  end

  def down
    change_column :booking_forms, :apartment_declaration, :integer, using: 'NULLIF(apartment_declaration, \'\')::integer'
    change_column :booking_forms, :infrastructure_and_development, :integer, using: 'NULLIF(infrastructure_and_development, \'\')::integer'
    change_column :booking_forms, :other_charges, :integer, using: 'NULLIF(other_charges, \'\')::integer'
  end
end
