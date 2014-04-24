class AddRestaurantIdColumnToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :review_id, :integer
  	add_column :ratings, :restaurant_id, :integer
  end
end
