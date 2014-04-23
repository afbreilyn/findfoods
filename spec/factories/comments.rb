FactoryGirl.define do 
	factory :comment do
		body { Faker::Lorem.paragraph }
		user_id 1
	end
end