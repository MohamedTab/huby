class AddRateToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :restaurant_rate, :integer
  end
end
