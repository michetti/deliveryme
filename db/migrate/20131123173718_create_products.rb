class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :restaurant_id
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end

    add_index :products, :restaurant_id
  end
end
