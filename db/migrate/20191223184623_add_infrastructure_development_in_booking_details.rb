class AddInfrastructureDevelopmentInBookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :infrastructure_development_cost, :float, :default => 0
  end
end
