class AddColumnToPaymentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_details, :payment_date, :string
  end
end
