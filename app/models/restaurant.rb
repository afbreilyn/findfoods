class Restaurant < ActiveRecord::Base

	validates :name, :presence => true
	validates :street1, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true, :length => { :maximum => 2 }
	validates :zipcode, :presence => true
	validates :owner_id, :presence => true

	belongs_to(
		:owner,
		class_name: "User",
		foreign_key: :owner_id,
		primary_key: :id
	)

end
