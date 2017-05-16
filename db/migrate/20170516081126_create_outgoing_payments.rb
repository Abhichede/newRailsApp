class CreateOutgoingPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :outgoing_payments do |t|

      t.string :payment_for
      t.string :amount
      t.string :payment_method
      t.string :payment_description
      t.string :site_id
      t.string :paid_by
      t.string :date
      t.boolean :deleting_status, default: false

      t.timestamps
    end
  end
end
