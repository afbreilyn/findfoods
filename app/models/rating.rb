class Rating < ActiveRecord::Base

	validates :restaurant_id, :user_id, :comment_id, presence: true
	validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 7, allow_nil: true }

	belongs_to :restaurant
	belongs_to :user
	belongs_to :comment


	def rating_stars

		if rating == 0
			stars = [""]
		elsif rating <= 0.5
			stars = ["fa fa-half-star"]
		elsif rating < 1
			stars = ["fa fa-star"]
		elsif rating < 1.5
			stars = ["fa fa-star", "fa fa-star-half"]
		elsif rating < 2
			stars = ["fa fa-star", "fa fa-star"]
		elsif rating < 2.5
			stars = ["fa fa-star", "fa fa-star", "fa fa-star-half"]
		elsif rating < 3
			stars = ["fa fa-star", "fa fa-star", "fa fa-star"]
		elsif rating < 3.5
			stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star-half"]
		elsif rating < 4
			stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star"]
		elsif rating <= 4.5
			stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star-half"]
		else 
			stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star"]
		end

		return stars
	end

end