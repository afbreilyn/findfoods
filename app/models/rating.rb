class Rating < ActiveRecord::Base

	validates :restaurant_id, :user_id, :comment_id, presence: true

	belongs_to :restaurant
	belongs_to :user
	belongs_to :comment

end