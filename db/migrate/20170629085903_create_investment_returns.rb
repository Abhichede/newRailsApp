class CreateInvestmentReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :investment_returns do |t|
      t.string :date
      t.integer :investment_id
      t.string :amount
      t.string :description, default: 'NA'

      t.timestamps
    end
  end
end
