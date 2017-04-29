class AddColumnTobookingDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_details, :token_amount, :string
  end
end
