class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :mobile
      t.string :other_desc

      t.timestamps
    end
  end
end
