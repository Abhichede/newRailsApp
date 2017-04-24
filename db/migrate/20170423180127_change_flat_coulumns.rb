class ChangeFlatCoulumns < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :govt_rate, :string
    add_column :flats, :govt_value, :string
    add_column :flats, :type, :string
    add_column :flats, :wing, :string
    add_column :flats, :amenities, :string

    remove_column :flats, :MSEB_charges
    remove_column :flats, :other_charges
    remove_column :flats, :water_charges
    remove_column :flats, :parking_charges
    remove_column :flats, :maintainance_charges
    remove_column :flats, :govt_charges

  end
end
