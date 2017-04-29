class AddColumnToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :site_type, :string
  end
end
