class AddanatherColumnToInvestmentMonthlyInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :investment_monthly_interests, :pending_interest, :decimal, default: 0
  end
end
