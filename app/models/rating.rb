class Rating < ActiveRecord::Base

	validates :restaurant_id, :user_id, :comment_id, presence: true
	validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 7, allow_nil: true }

	belongs_to :restaurant
	belongs_to :user
	belongs_to :comment

end