class AddColumnToSitesNoOfWings < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :no_of_wings, :string
  end
end
