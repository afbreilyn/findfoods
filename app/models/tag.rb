class Tag < ActiveRecord::Base
	validates :user_id, :body, :restaurant_id, presence: true

	belongs_to :restaurant
	belongs_to :user

end