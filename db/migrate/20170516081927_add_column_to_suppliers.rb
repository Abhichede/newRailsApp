class AddColumnToSuppliers < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :total_amount, :string
    add_column :suppliers, :paid_amount, :string
  end
end
