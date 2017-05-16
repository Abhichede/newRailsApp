class AddColomnDeleteStatusToSuppliers < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :deleting_status, :string
  end
end
