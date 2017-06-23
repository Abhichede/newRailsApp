class ModifyTableSites < ActiveRecord::Migration[5.0]
  def change
    rename_column :sites, :no_of_units, :no_of_flats
    add_column :sites, :no_of_shops, :string
  end
end
