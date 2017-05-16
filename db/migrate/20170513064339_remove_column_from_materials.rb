class RemoveColumnFromMaterials < ActiveRecord::Migration[5.0]
  def change
    remove_column :materials, :name_of_supplier
  end
end
