class AddAndRenameColumnNameToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :project_approved_by, :string
    add_column :sites, :photo_path, :string

    rename_column :sites, :flat_count, :no_of_units
    rename_column :sites, :area, :area_of_plot
    rename_column :sites, :site_type, :type_of_structures
  end
end
