class AddLongandLattoRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :latitude, :float
  	add_column :restaurants, :longitude, :float

  	add_index :restaurants, :latitude
  	add_index :restaurants, :longitude
  end
end
