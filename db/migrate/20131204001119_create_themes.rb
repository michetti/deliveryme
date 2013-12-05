class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name      , null: false
      t.text :description
      t.string :path      , null: false
      t.string :parent

      t.timestamps
    end

    add_index :themes, :name, unique: true
    add_index :themes, :path, unique: true
  end
end
