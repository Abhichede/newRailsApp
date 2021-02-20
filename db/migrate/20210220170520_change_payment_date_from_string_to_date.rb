class ChangePaymentDateFromStringToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :partner_payments, :date, 'date USING CAST(date AS date)'
  end
end
