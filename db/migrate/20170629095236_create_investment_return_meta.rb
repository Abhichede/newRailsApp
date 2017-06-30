class CreateInvestmentReturnMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :investment_return_meta do |t|
      t.integer :investment_id
      t.string :meta_key
      t.string :meta

      t.timestamps
    end
  end
end
