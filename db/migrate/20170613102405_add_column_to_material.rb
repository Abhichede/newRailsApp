class AddColumnToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :description, :string, default: 'NA'
    add_column :materials, :challan_item, :string, default: 'NA'
  end
end
