# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_arr = %w(chinese, japanese, itialian, thai, german, french, american, english, indian,
		dutch, burgers, pizza, mexican, fusion, hoiday, appetizers, breads, chocolate, 
		convenience, fast, meat, steak, dessert, pies, puddings, stews, kosher, breakfast, 
		sandwich, icecream, noodles)

	jonathan = User.create!(
		fname: "Jonathan",
		lname: "Tamboer",
		city: "Amsterdam",
		state: "NH",
		email: "jt@example.com",
		password: "password",
		avatar: File.open(Rails.root.join("seeds", "jonathan.jpeg"))
	)

	jonathan.restaurants.create!(
		name: "Senaccy's Delight",
		street1: "27 Cooper Square",
		city: "New York City",
		state: "NY",
		zip: 10003,
		avatar: File.open(Rails.root.join("seeds", "happy-cat.jpg"))
	)

	afb = User.create!(
		fname: "Aaron",
		mname: "Foster",
		lname: "Bresley",
		city: "Camisano",
		state: "VT",
		email: "afb@example.com",
		password: "password",
		avatar: File.open(Rails.root.join("seeds", "Wheat_Field_with_Crows_(1890).jpg"))
	)

	afb.restaurants.create!(
		name: "Aaron's Awesome Chinese 1",
		street1: "200 Broadway",
		city: "New York City",
		state: "NY",
		zip: 10003,
		avatar: File.open(Rails.root.join("seeds", "nom_noodles.jpg"))
	)

	afb.restaurants.create!(
		name: "Aaron's Awesome Chinese 2",
		street1: "2 5th Street",
		city: "New York City",
		state: "NY",
		zip: 10003,
		avatar: File.open(Rails.root.join("seeds", "nom_noodles.jpg"))
	)

suckr = ImageSuckr::GoogleSuckr.new

users = []
10.times do 
	users << User.create!(
		fname: Faker::Name.first_name,
		lname: Faker::Name.last_name,
		city: Faker::Address.city,
		state: Faker::Address.state_abbr,
		email: Faker::Internet.safe_email,
		password: "password",
		avatar: suckr.get_image_file({"q" => "portrait"})
	)
end

restaurants = []
5.times do 
	restaurants << Restaurant.create!(
		name: Faker::Company.name,
		street1: Faker::Address.street_address,
		city: Faker::Address.city,
		state: Faker::Address.state_abbr,
		zip: Faker::Address.zip,
		owner_id: users.sample.id
	)
end

restaurants.each do |restaurant|
	unless restaurant.latitude
		restaurant.zip = Faker::Address.zip
	end
end

reviews = []
5.times do 
	reviews << users.sample.written_comments.create!(
		commentable_type: "Restaurant",
		commentable_id: restaurants.sample.id,
		body: "Ubique invidunt cu vix, pri an wisi omnium vidisse"
	)
end

5.times do 
	restaurants.sample.tags.create!(
		author_id: users.sample.id,
		body: food_arr.sample
	)
end

reviews.each do |review|
	review.create_rating!(
		rating: rand(5),
		user_id: review.user_id,
		restaurant_id: review.commentable_id
	)
end