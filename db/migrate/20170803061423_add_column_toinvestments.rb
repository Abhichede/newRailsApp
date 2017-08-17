class AddColumnToinvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :investments, :is_monthly, :boolean, :default => true
    add_column :investments, :returning_date, :string, :default => 'NA'

    change_column_default(:investments, :interest_rate, '0')
  end
end
