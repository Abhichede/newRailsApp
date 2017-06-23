class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.string :email
      t.boolean :deleting_status
      t.string :created_by

      t.timestamps
    end
  end
end
