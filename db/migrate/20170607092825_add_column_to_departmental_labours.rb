class AddColumnToDepartmentalLabours < ActiveRecord::Migration[5.0]
  def change
    add_column :departmental_labours, :site_id, :integer
  end
end
