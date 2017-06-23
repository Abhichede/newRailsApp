class CreateContractLists < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_lists do |t|

      t.string :name
      t.boolean :deleting_status, default: false

      t.timestamps
    end
  end
end
