class CreateTypeOfStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_structures do |t|
      t.string :name
      t.timestamps
    end
  end
end
