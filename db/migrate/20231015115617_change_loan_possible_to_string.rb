class ChangeLoanPossibleToString < ActiveRecord::Migration[5.0]
  def change
    change_column :booking_forms, :loan_possible, :string
  end
end
