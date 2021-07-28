class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :item_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
