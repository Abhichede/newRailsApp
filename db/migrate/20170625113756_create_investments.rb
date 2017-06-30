class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.integer :investor_id
      t.string :investment_date
      t.string :investment_amount
      t.string :interest_rate
      t.string :created_by
      t.string :deleting_status, default: false
      t.string :returned_amount, default: '0'
      t.string :last_return_date, default: ''
      t.string :last_month_interest, default: ''
      t.string :current_month_interest, default: ''
      t.string :total_payable_amount, default: ''

      t.timestamps
    end
  end
end
