class AddAndRemoveColumnFromContractor < ActiveRecord::Migration[5.0]
  def change
    remove_column :contractors, :site_id
    remove_column :contractors, :contractual_labour_id

    add_column :contractors, :total_amount, :string
    add_column :contractors, :paid_amount, :string
  end
end
