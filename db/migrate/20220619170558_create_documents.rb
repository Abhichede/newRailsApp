class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.integer :customer_document_id
      t.string :path
    end
  end
end
