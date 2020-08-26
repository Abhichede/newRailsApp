class CreateCustomerDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_documents do |t|
      t.integer :booking_detail_id
      t.string :name
      t.text :description
      t.string :path

      t.timestamps
    end
  end
end
