FactoryGirl.define do 
	factory :user do
		fname { Faker::Name.first_name }
		lname { Faker::Name.last_name }

		city { Faker::Address.city }
		state { Faker::Address.state_abbr }

		email { Faker::Internet.free_email }
		password { Faker::Internet.password }
	end
end