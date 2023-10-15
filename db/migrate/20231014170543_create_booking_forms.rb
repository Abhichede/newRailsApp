class CreateBookingForms < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_forms do |t|
      t.string :date
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :adhar
      t.string :pan_number
      t.string :building_name
      t.string :unit_no
      t.string :type_of_unit
      t.string :area
      t.string :floor
      t.integer :flat_cost
      t.integer :mseb_and_other_charges
      t.integer :water_charges
      t.integer :booking_charges
      t.integer :balance_amount
      t.integer :gst
      t.integer :allotted_parking_charges
      t.integer :maintenance_charges
      t.integer :loan_possible
      t.integer :actual_agreement_cost
      t.integer :government_consideration
      t.integer :stamp_duty
      t.integer :registration_charges
      t.integer :final_sale_deed_fees
      t.integer :apartment_declaration
      t.integer :infrastructure_and_development
      t.text :amenities_difference
      t.text :terms_and_conditions
      t.text :extras

      t.timestamps
    end
  end
end
