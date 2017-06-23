class CreateContractualLabours < ActiveRecord::Migration[5.0]
  def change
    create_table :contractual_labours do |t|
      t.string :date
      t.string :contract_name
      t.string :name_of_contractor
      t.string :quantity
      t.string :unit
      t.string :rate
      t.string :amount
      t.string :created_by

      t.timestamps
    end
  end
end
