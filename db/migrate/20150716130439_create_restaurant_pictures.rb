class CreateRestaurantPictures < ActiveRecord::Migration
  def change
    create_table :restaurant_pictures do |t|

      t.timestamps
    end
  end
end
