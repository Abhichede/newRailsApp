class AddColumnToContractualLabour < ActiveRecord::Migration[5.0]
  def change
    add_column :contractual_labours, :paid_amount, :string, default: '0'
  end
end
