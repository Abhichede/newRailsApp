class ChangeBookingFormNumericFieldsToString < ActiveRecord::Migration[5.0]
  INTEGER_CHARGE_COLUMNS = %i[
    flat_cost
    government_consideration
    actual_agreement_cost
    mseb_and_other_charges
    water_charges
    allotted_parking_charges
    maintenance_charges
    stamp_duty
    registration_charges
    gst
    legal_charges
    booking_charges
    balance_amount
    package_amount
  ].freeze

  def up
    INTEGER_CHARGE_COLUMNS.each do |column|
      change_column :booking_forms, column, :string
    end
  end

  def down
    INTEGER_CHARGE_COLUMNS.each do |column|
      change_column :booking_forms, column, :integer, using: "NULLIF(#{column}, '')::integer"
    end
  end
end
