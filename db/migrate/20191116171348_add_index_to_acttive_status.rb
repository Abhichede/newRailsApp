class AddIndexToActtiveStatus < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :active
  end
end
