class AddColoumnToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :booking_date, :string
  end
end
