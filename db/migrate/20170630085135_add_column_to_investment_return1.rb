class AddColumnToInvestmentReturn1 < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_returns, :paid_by, :string
    add_column :investment_returns, :deleting_status, :boolean, default: false
  end
end
