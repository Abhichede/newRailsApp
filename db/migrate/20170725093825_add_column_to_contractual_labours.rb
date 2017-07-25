class AddColumnToContractualLabours < ActiveRecord::Migration[5.0]
  def change
    add_column :contractual_labours, :gst_rate, :string, default: '0'
    add_column :contractual_labours, :gst_cost, :string, default: '0'
    add_column :contractual_labours, :tds_rate, :string, default: '0'
    add_column :contractual_labours, :tds_cost, :string, default: '0'
  end
end
