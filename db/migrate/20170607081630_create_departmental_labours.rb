class CreateDepartmentalLabours < ActiveRecord::Migration[5.0]
  def change
    create_table :departmental_labours do |t|
      t.string :date
      t.string :type_of_work
      t.string :amount
      t.string :paid_amount

      t.timestamps
    end
  end
end
