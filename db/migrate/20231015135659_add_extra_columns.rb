class AddExtraColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :booking_forms, :amenities_difference, :project_address
    rename_column :booking_forms, :final_sale_deed_fees, :other_charges
  end
end
