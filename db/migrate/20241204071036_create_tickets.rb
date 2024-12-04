class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
