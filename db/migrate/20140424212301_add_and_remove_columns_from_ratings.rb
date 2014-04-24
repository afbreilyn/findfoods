class AddAndRemoveColumnsFromRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :user_id, :integer
  	remove_column :ratings, :review_id, :integer

  	add_index :ratings, :user_id
  end
end
