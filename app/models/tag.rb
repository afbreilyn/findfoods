class Tag < ActiveRecord::Base
	validates :author_id, :body, :restaurant_id, presence: true

	belongs_to :restaurant

	belongs_to(
		:author,
		class_name: "User",
		foreign_key: :author_id,
		primary_key: :id
	) 
	
	has_many :notifications, as: :notifiable, dependent: :destroy

	after_save :notify_owner

	def notify_owner
			self.notifications.create(
				user_id: self.restaurant.owner.id,
				event_id: NOTIFICATION_EVENTS_IDS[:were_tagged]
			)
	end

end