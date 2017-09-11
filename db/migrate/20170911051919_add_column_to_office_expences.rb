class AddColumnToOfficeExpences < ActiveRecord::Migration[5.0]
  def change
    add_column :office_expences, :site_id, :integer
  end
end
