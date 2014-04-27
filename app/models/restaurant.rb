class Restaurant < ActiveRecord::Base

	validates :name, :street1, :city, :zip, :owner_id, presence: true
	validates :state, presence: true, length: { maximum: 2 }

	belongs_to(
		:owner,
		class_name: "User",
		foreign_key: :owner_id,
		primary_key: :id
	)

	has_many :tags
	
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :notifications, as: :notifiable
	
	has_many :ratings, dependent: :destroy

	has_attached_file :avatar, styles: {thumb: "100x100>", full: "200x200>"}, :default_url => "http://www.clker.com/cliparts/h/1/9/c/9/w/restaurant-md.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def comments_by_parent
		comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
		comments.each do |comment|
			comments_by_parent[comment.parent_comment_id] << comment
		end
		
		comments_by_parent
	end

	def average_rating
		average_rating = 0.0
		tot_rating = 0.0

		ratings.each do |rate|
			average_rating += rate.rating.to_f
			tot_rating += 1
		end

		average_rating = average_rating/tot_rating

		if !(average_rating >= 0)
			return "No Stars Yet!"
		end

		return "#{average_rating} stars!!!"
	end
	 
end
