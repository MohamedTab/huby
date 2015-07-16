class AddRestaurantRefToRestaurantPictures < ActiveRecord::Migration
  def change
    add_reference :restaurant_pictures, :restaurant, index: true, foreign_key: true
  end
end
