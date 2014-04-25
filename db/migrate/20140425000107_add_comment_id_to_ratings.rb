class AddCommentIdToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :comment_id, :integer
  end
end
