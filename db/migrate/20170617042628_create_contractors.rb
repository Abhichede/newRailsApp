class CreateContractors < ActiveRecord::Migration[5.0]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :contact_number
      t.string :address
      t.integer :site_id
      t.integer :contractual_labour_id

      t.timestamps
    end
  end
end
