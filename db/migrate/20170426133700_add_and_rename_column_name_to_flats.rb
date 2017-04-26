class AddAndRenameColumnNameToFlats < ActiveRecord::Migration[5.0]
  def change
    add_column  :flats, :flat_rate, :string
  end
end
