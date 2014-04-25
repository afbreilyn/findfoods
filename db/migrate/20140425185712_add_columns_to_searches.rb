class AddColumnsToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :search_params, :text
  	add_column :searches, :start_location, :text

  	add_index :searches, :search_params
  	add_index :searches, :start_location
  end
end
