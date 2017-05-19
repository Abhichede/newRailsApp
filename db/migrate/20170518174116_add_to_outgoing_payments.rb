class AddToOutgoingPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :outgoing_payments, :payment_to, :string, default: 'NA'
  end
end
