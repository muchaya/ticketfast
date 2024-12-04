class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 0
      t.references :cart, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
