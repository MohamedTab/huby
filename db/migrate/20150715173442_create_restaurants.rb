class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :seat
      t.string :number_phone
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
