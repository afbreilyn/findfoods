class Search < ActiveRecord::Base


	# validates :search_params, :start_location, :presence => true

	belongs_to(
		:user,
		class_name: "User",
		foreign_key: :user_id,
		primary_key: :id
	)

end
