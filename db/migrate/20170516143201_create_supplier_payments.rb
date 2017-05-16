class CreateSupplierPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :supplier_payments do |t|
      t.integer :supplier_id
      t.integer :material_id
      t.integer :site_id
      t.string :amount
      t.string :payment_method
      t.string :payment_desc
      t.string :payment_date
      t.string :paid_by

      t.timestamps
    end
  end
end
