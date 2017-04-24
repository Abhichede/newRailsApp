class RemoveColumnsFromFlats < ActiveRecord::Migration[5.0]
  def change
    remove_column :flats, :MSEB_charges
    remove_column :flats, :other_charges
    remove_column :flats, :water_charges
    remove_column :flats, :parking_charges
    remove_column :flats, :maintenance_charges
    remove_column :flats, :govt_charges
  end
end
