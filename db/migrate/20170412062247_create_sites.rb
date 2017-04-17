class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.text :address
      t.integer :flat_count
      t.string :site_type
      t.string :unit_number
      t.string :area

      t.timestamps
    end
  end
end
