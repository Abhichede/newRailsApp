class CreateBookingDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :'booking_details.js' do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_contact
      t.string :customer_pan
      t.string :customer_adhar
      t.integer :site_id
      t.integer :flat_id
      t.string :booking_charges
      t.string :vat
      t.string :service_tax
      t.boolean :loan_possible
      t.string :agreement_cost
      t.string :registration_fees
      t.string :final_sale_deed_fees
      t.string :stamp_duty
      t.string :other_charges

      t.timestamps
    end
  end
end
