class Notification < ActiveRecord::Base

	EVENTS = {
		1 => "received review",
		2 => "received comment",
		3 => "were followed",
		4 => "was tagged"
	}

	validates :notifiable_id, :notifiable_type, :user_id, :event_id, presence: true
	
	belongs_to :notifiable, polymorphic: true
	belongs_to :user

	def notification_text
		event = EVENTS[self.event_id]

		case event
		when "received review"

			source_comment = Comment.find(notifiable_id)
			reviewer = User.find(source_comment.user_id)
			restaurant = Restaurant.find(source_comment.commentable_id)
			restaurant_owner = User.find(restaurant.owner_id)

			return "You are #{restaurant_owner.fname}. Your restaurant, #{ restaurant.name }, was reviewed by #{ reviewer.fname }."
		when "received comment"
			source_comment = Comment.find(notifiable_id)
			reviewer = User.find(source_comment.user_id)
			return "Your review received a comment by #{ reviewer.fname }."
		end
	end


end
