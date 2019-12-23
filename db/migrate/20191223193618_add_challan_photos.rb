class AddChallanPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :challan_photos, :json
  end
end
