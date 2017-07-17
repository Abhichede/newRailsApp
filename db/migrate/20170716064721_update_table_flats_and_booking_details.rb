class UpdateTableFlatsAndBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :flat_cost, :string, :default => '0'
    add_column :booking_details, :is_gst, :boolean, :default => false
    add_column :booking_details, :gst_rate, :integer, :default => 0
    add_column :booking_details, :gst_cost, :string, :default => '0'

    add_column :materials, :bill_no, :string, :default => 'NA'
    add_column :materials, :is_gst, :boolean, :default => false
    add_column :materials, :gst_rate, :integer, :default => 0
    add_column :materials, :gst_cost, :string, :default => '0'


  end
end
