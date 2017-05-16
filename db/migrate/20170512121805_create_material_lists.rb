class CreateMaterialLists < ActiveRecord::Migration[5.0]
  def change
    create_table :material_lists do |t|
      t.string :material_name
      t.string :material_unit
      t.boolean :deleting_status
      t.timestamps
    end
  end
end
