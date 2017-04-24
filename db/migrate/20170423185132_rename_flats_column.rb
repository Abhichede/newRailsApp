class RenameFlatsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :flats, :type, :flat_type
  end
end
