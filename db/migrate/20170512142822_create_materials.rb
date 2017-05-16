class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :date
      t.string :name_of_supplier
      t.integer :supplier_id
      t.integer :site_id
      t.string :type_of_material
      t.string :quantity
      t.string :unit
      t.string :challan_no
      t.string :truck_no
      t.string :time
      t.string :rate
      t.string :amount
      t.string :supervisor_name

      t.timestamps
    end
  end
end
