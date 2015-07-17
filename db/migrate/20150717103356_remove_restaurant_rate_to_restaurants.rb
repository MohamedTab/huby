class RemoveRestaurantRateToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :restaurant_rate
  end
end
