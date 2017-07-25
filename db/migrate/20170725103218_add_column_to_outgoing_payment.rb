class AddColumnToOutgoingPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :outgoing_payments, :payment_for_id, :integer
  end
end
