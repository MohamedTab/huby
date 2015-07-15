class RemoveLocalityToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :locality
  end
end
