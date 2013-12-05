class AddThemeIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :theme_id, :integer
  end
end
