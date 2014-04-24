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
		if self.parent_comment == nil
			self.notifications.create(
				user_id: Restaurant.find(commentable_id).owner_id,
				event_id: 1
			)
		else
			self.notifications.create(
				user_id: Comment.find(parent_comment_id).user_id,
				event_id: 2
			)
		end
	end

end
