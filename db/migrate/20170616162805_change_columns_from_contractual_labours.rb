class ChangeColumnsFromContractualLabours < ActiveRecord::Migration[5.0]
  def change
    rename_column :contractual_labours, :name_of_contractor, :contractor_id
    change_column :contractual_labours, :contractor_id, "integer USING CAST(#{:contractor_id} AS integer)"
    # ==> write :integer instead of double quoted text from above line for MYSQL only
  end
end
