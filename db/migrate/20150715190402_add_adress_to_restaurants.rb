class AddAdressToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :locality, :string
  end
end
