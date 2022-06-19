class AddContractorIdInDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_documents, :contractor_id, :integer
  end
end
