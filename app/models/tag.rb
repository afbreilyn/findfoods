class Tag < ActiveRecord::Base
	validates :author_id, :body, :restaurant_id, presence: true

	belongs_to :restaurant

	belongs_to(
		:author,
		class_name: "User",
		foreign_key: :author_id,
		primary_key: :id
	) 
	
	has_many :notifications, as: :notifiable

end