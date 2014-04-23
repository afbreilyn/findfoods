# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
  	name { Faker::Company.name }
  	
  	street1 { Faker::Address.street_address }
  	city { Faker::Address.city }
		state { Faker::Address.state_abbr }
  	zip { Faker::Address.zip_code }

  	owner_id = 1
  	
  end
end
