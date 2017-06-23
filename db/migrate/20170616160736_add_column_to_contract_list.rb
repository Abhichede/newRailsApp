class AddColumnToContractList < ActiveRecord::Migration[5.0]
  def change
    add_column :contract_lists, :contract_unit, :string
  end
end
