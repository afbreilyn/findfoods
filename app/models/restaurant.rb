class Restaurant < ActiveRecord::Base

	validates :name, :street1, :city, :zip, :owner_id, presence: true
	validates :state, presence: true, length: { maximum: 2 }

	belongs_to(
		:owner,
		class_name: "User",
		foreign_key: :owner_id,
		primary_key: :id
	)

	has_many :comments, as: :commentable, dependent: :destroy
	
	def comments_by_parent
		comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
		comments.each do |comment|
			comments_by_parent[comment.parent_comment_id] << comment
		end
		
		comments_by_parent
	end

	 
end
