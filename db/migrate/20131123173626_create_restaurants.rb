class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :subdomain
      t.string :domain

      t.timestamps
    end

    add_index :restaurants, :subdomain, unique: true
    add_index :restaurants, :domain
  end
end
