# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_arr = %w(chinese japanese itialian thai german french american english indian
		dutch burgers pizza mexican fusion hoiday appetizers breads chocolate 
		convenience fast meat steak dessert pies puddings stewskosher breakfast, 
		sandwich icecream noodles)

cities = %w(Shanghai Beijing Lagos Istanbul Karachi Mumbai Moscow São Paulo Guangzhou 
	Delhi Shenzhen Seoul Jakarta Kinshasa Tainjin Tokyo Cairo Chaka Mexico Lima Bangalor 
	NYC London Bangkok Dongguan Tehran Bogotá Baghdad Wuhan Hanoi Hyderabad Lahore Foshan
	Santiago Riyadh Ahmedabad Singapore Shantou Luanda Abidjan Chengdu Yangon Chennai 
	Alexandria Chongqing Kolkata Surat Johannesburg Nanjing Boston Montreal Newark Dallas 
	Austin Ogden Charlette Atlanta Columbus Houston Lexinton Fayetteville Asheville Cambridge
	Louisville Boise Knoxville Perth Tallinn Tashkent Tehran Tirana Tirana Tokyo Tripoli
	Windhoek Yaren Zagreb Windhoek Vaduz Rome Florence Venice Hamburg Berlin Cairo Jerusalem
	Saipan  Rabat Quito Pyongyang Prague Getinje Paris Dijon Panama Oslo Nicosia Nuuk Monaco)

cities.concat(["Ho Chi Minh City", "Saint Petersburg", "Mexico City", "Hong Kong", 
							"Rio de Janerio", "Xi'an", "Los Angeles", "San Antonio", "Salt Lake City", ])

reviews_samples = [
	"Great, fun place to walk around, shop and eat! Kid friendly, highly recommend going to 
	the artist's flea next door.",

	"it is easy to imagine the worst if you walk by Glaser's Bake Shop without going inside.  
	The sign is easily 112 years old.  The vast majority of the store's numerous display cases 
	are empty and there appeared to be only 2 varieties of layer cakes.  But wait, step inside 
	the shop.  Talk to the women who work the counter, try their baked goods and be prepared to 
	be transported to a wonderful and simpler time. Simply put, Glaser's products are wonderful.  
	The layer cake and pound cake were moist and delicious.",

	"This is by far the best Italian deli I have ever been to.",

	"Awesome!"
]




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

users = []
75.times do 
	users << User.create!(
		fname: Faker::Name.first_name,
		lname: Faker::Name.last_name,
		city: Faker::Address.city,
		state: Faker::Address.state_abbr,
		email: Faker::Internet.safe_email,
		password: "password"
	)
end

restaurants = []
100.times do 
	restaurants << Restaurant.create!(
		name: Faker::Company.name,
		street1: Faker::Address.street_address,
		city: cities.sample,
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
50.times do 
	reviews << users.sample.written_comments.create!(
		commentable_type: "Restaurant",
		commentable_id: restaurants.sample.id,
		body: "Ubique invidunt cu vix, pri an wisi omnium vidisse"
	)
end

120.times do 
	restaurants.sample.tags.create!(
		author_id: users.sample.id,
		body: food_arr.sample
	)
end

reviews.each do |review|
	review.create_rating!(
		rating: rand(7),
		user_id: review.user_id,
		restaurant_id: review.commentable_id
	)
end