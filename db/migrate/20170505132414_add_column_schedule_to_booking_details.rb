class AddColumnScheduleToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :schedule_date, :string
    add_column :booking_details, :schedule_desc, :string
  end
end
