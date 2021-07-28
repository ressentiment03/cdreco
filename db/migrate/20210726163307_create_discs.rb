class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :item_id, null: false
      t.integer :sort, null: false

      t.timestamps
    end
  end
end
