class AddCurrentLocationColumnToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :current_lat, :numeric
  	add_column :searches, :current_long, :numeric

  	add_index :searches, :current_lat
  	add_index :searches, :current_long

  end
end
