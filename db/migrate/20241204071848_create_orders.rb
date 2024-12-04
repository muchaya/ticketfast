class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
