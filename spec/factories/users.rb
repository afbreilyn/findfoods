FactoryGirl.define do 
	factory :user do
		fname { |n| Faker::Name.first_name }
		lname { |n| Faker::Name.last_name }

		city { |n| Faker::Address.city }
		state { |n| Faker::Address.state_abbr }

		email { |n| Faker::Internet.free_email }
		password { |p| Faker::Internet.password }
	end
end