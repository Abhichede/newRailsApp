class AddColumnToInvestmentMonthlyInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_monthly_interests, :month, :string
  end
end
