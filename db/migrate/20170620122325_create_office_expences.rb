class CreateOfficeExpences < ActiveRecord::Migration[5.0]
  def change
    create_table :office_expences do |t|
      t.string :date
      t.string :description
      t.string :amount
      t.string :payment_to
      t.string :payment_method
      t.string :payment_desc
      t.string :paid_by
      t.boolean :deleting_status

      t.timestamps
    end
  end
end
