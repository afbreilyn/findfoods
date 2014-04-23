# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
  	name { |n| Faker::Company.name }
  	
  	street1 { |n| Faker::Address.street_address }
  	city { |n| Faker::Address.city }
		state { |n| Faker::Address.state_abbr }
  	zip { |n| Faker::Address.zip_code }

  	owner_id = 1

  end
end
