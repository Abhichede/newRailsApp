class CreateInvestmentMonthlyInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :investment_monthly_interests do |t|
      t.integer :investment_id
      t.string :interest_rate
      t.string :interest
      t.string :paid_interest, default: '0'
      t.string :paid_date, default: 'nil'
      t.string :paid_by, default: 'NA'


      t.timestamps
    end
  end
end
