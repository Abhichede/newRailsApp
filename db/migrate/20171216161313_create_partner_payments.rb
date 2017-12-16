class CreatePartnerPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :partner_payments do |t|
      t.string :payment_type
      t.string :date
      t.string :amount
      t.string :payment_method
      t.string :payment_desc
      t.integer :partner_id

      t.timestamps
    end
  end
end
