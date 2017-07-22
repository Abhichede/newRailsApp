class AddColumnsToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :is_rate_added, :boolean, default: false
    add_column :materials, :rate_added_by, :string, default: 'NA'
    add_column :materials, :rate_added_at, :timestamp, default: Time.now
  end
end
