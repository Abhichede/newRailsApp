class AddAndRenameColumnNameToBookingDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :booking_details, :govt_charges, :legal_charges
    rename_column :booking_details, :final_sale_deed_fees, :lbt

    remove_column :booking_details, :booking_charges

    add_column :booking_details, :name_of_bank, :string
    add_column :booking_details, :branch_of_bank, :string
    add_column :booking_details, :sanctioned_amount, :string
    add_column :booking_details, :employee_name, :string
  end
end
