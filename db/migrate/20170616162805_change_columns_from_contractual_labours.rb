class ChangeColumnsFromContractualLabours < ActiveRecord::Migration[5.0]
  def change
    rename_column :contractual_labours, :name_of_contractor, :contractor_id
  end
end
