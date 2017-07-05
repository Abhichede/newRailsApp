class AddColumnToInvestmentReturn < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_returns, :payment_method, :string, default: 'NA'
  end
end
