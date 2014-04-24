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

end
