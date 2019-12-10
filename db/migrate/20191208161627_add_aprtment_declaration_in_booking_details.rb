class AddAprtmentDeclarationInBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :apartment_declaration, :float, :default => 0
  end
end
