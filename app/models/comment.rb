class Comment < ActiveRecord::Base

	belongs_to :commentable, polymorphic: true

	validates :body, :user_id, presence: true

	has_many(
		:child_comments,
		class_name: "Comment",
		foreign_key: :parent_comment_id,
		primary_key: :id
	)

	belongs_to(
		:parent_comment,
		class_name: "Comment",
		foreign_key: :parent_comment_id,
		primary_key: :id
	)

	has_many :notifications, as: :notifiable, dependent: :destroy

	after_save :notify_owner

	def notify_owner
		if self.parent_comment
			self.notifications.create(
				user_id: Comment.find(parent_comment_id).user_id,
				event_id: NOTIFICATION_EVENTS_IDS[:received_comment],
				read: false
			)
		else
			self.notifications.create(
				read: false,
				user_id: self.commentable.owner.id,
				event_id: NOTIFICATION_EVENTS_IDS[:received_review]
			)
		end
	end

end

