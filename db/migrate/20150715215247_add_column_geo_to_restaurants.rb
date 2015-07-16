class AddColumnGeoToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :street_number, :string
    add_column :restaurants, :route, :string
    add_column :restaurants, :locality, :string
    add_column :restaurants, :country, :string
  end
end
