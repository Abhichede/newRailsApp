class CreatePaymentTable < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_details do |t|
      t.string :payable_amount
      t.string :payment_type
      t.string :payment_desc
      t.integer :booking_detail_id

      t.timestamps
    end
  end
end
