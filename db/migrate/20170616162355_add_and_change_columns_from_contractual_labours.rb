class AddAndChangeColumnsFromContractualLabours < ActiveRecord::Migration[5.0]
  def change
     add_column :contractual_labours, :site_id,:integer

  end
end
