<<<<<<< HEAD
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
    Santiago Riyadh Ahmedabad Singapore Shantou Luanda Abidjan Chengdu Chennai 
    Alexandria Chongqing Kolkata Surat Johannesburg Nanjing Boston Montreal Newark Dallas 
    Austin Charlette Atlanta Columbus Houston Lexinton Fayetteville Asheville Cambridge
    Louisville Boise Knoxville Perth Tallinn Tashkent Tehran Tirana Tirana Tokyo Tripoli
    Windhoek Yaren Zagreb Windhoek Vaduz Rome Florence Venice Hamburg Berlin Cairo Jerusalem
    Saipan Rabat Quito Prague Getinje Paris Dijon Panama Oslo Nicosia Nuuk Monaco)

  cities.concat(["Saint Petersburg", "Mexico City", "Hong Kong", 
                  "Xi'an", "Los Angeles", "San Antonio", "Salt Lake City", ])

  reviews_samples = [
    "Great, fun place to walk around, shop and eat! Kid friendly, highly recommend going to 
    the artist's flea next door.",

    "it is easy to imagine the worst if you walk by Glaser's Bake Shop without going inside.",

    "The sign is easily 112 years old.  The vast majority of the store's numerous display cases are empty and there appeared to be only 2 varieties of layer cakes.  But wait, step inside the shop.  Talk to the women who work the counter, try their baked goods and be prepared to be transported to a wonderful and simpler time. Simply put: wonderful.",

    "The layer cake and pound cake were moist and delicious.",

    "This is by far the best Italian deli I have ever been to.",

    "Awesome!", "Thoroughly okay.", "Would go again", "Meh", "Wonderful!", "Simply the best food ever.", "They were alright, but the had the best cat ever there, named Sennacy!",

    "Truly an amazing dining experience", "Definitely not your traditional Japanese meal, but a wonderful balance between traditional flavors and modern creative techniques. The only disappointment was desert and the fact that they don't allow personal wine.",
    "This is not a place for those that experience sticker shock when paying for a meal, but overall was an excellent experience. The service was also amazing and the staff were extremely friendly and helpful in providing some recommendations for the rest of our trip.",
    "Simply fantastic. Second time here - 1st time at a table, this time at the bar. Very good service and great food both times. Very fresh, inovative sushi. You will not find anything elese like this. Equal to, and arguably better than, those 'name' places in Manhattan without the hyps. ",
    "I just want to start by saying that this is definitely not something you expect to find in Boston. My husband and I wondered why they have not yet received their Michelin rating!!!!",
    "Flavors exploding in your mouth, incredible pairings of ingredients you would never imagine could be done ... Truly artistic!! And as such you also need to be prepared for the price to pay for such an experience!!! But it is worth every dollar!! ",
    "We did the 17 course tasting , with beverage pairing. It was truly amazing, with beautifully prepared and presented food. Maybe the best restaurant",
    "Shockingly bad,,,,so disappointed", "Not so, the fish quality is poor. By taking a butane burner and adding some char to the fish, it's going to disguise the fish taste. ITS ALL ABOUT BUTTER !!!",
    "Service was horrible.", "At times interminable wait between courses and then some arrived within seconds of each other, at same time. Food was off.", "Extraordinary offerings, extremely high quality, creativity, service by passionate people, amazing list of sakes, perfect reception and related by the hostesses. The omikase menu of 17 pieces with matching wines is a perfect introduction.",
    "Have been coming here for at least once a week. Still refuse to let me use the restroom before making any purchase.", "recently tried this place and it was cozy,with a friendly staff,but i have to say the food was lackluster and lifeless.I had the Mole,which was very bland...prices are on the steep side as well.Try it if you want,but a better choice is just  blocks away on Bell blvd,and it wouldnt be fair to mention the name here.",
    "If you are looking for an intelligent, kind and caring oral surgeon, Dr. Calat is the one!  He puts you at ease and explains the procedure clearly and patiently.  He is extremely competent and surgically skilled.",
    "Very dated decor and lackluster service. The food was uninspiring.... Barely above typical greasy spoon diner fare. I was pretty disappointed given the better than average reviews by Yelpers. I didn't hate it, but I don't think I'll be back.",
    "Great place and great staff!  Perfect personalities working behind the bar. Good to have another live venue space in the hood!",
    "Basically sushi-on-the-go. Almost everything is wrapped or boxed to go. Individual sushi or sashimi and bentos are ready to be picked up to pay and go. Big joint with a nice bright, vibrant, and clean atmosphere. Only been getting their onigiri which need a wrapping redesign. 3 simple steps but the plastic wrap always pulls out everything from the seaweed. Prices are a bit high in my opinion. Onigiris are $3 (should be like $2) and bentos for $12. I guess it's the convenience of packaging that warrants the prices.",
    "What a wonderful place. The owner goes out of his way to help you in every way possible.",
    "Pros: No wait. Considering these guys are a notorious bunching spot, I was definitely impressed at the crowd control. They move endless brunch to the bar, which is smart, but gets extremely crowded. Our waiter was quick & attentive. He was there with the (luke warm) mimosa pitcher before we blinked and they were full. The poached eggs were delicious.",
    "It had been about 10 years since I'd last had a Katz's pastrami sandwich.  I thought for sure that nostalgia for the big city and the haze produced by drunken revelry of late nights long past had built up my expectations to the point where I'd surely be disappointed by the sandwich.",
    "Ping's has some really good Chinese food, but they are very expensive for Chinatown.  This review would be much better set as a 3.5 out of 4.  ",
    "Their decor is slightly above the mostly run-down look of Chinatown and they definitely stand out against their more traditional competitors, but IDK if the heavy price tag and small portions are worth it.  For example, a salt-baked chicken cost $50 ... it wasn't even THAT good.  Other places would sell ~$15 tops in Chinatown.",
    "The decor at this place is interesting. It's definitely a fun vibe. The food is good, but nothing earth shattering.  The service is hit or miss though, depending on the staff on hand.",
    "great food at reasonable prices.... everything is homemade and you can tell with every bite... food made with love",
    "U can't go wrong here.  The BBQ is delicious (sandwich or naked) and the price point is just right.  The brisket is my fave and they are totally cool about carving off the fat when I ask for it lean.  The pickled fixings are free and don't forget to load up on sides like the maple pecan sweet potatoes and pomme frites.  The place does get crowded so it's best to try to claim a seat before u line up to order food.  If it seems impossible, don't worry, the friendly staff will help seat u.  ",
    "The food here is good, but a little pricey, and the portions are small. They also tend to run out of drinks a lot (hopefully this has gotten better?) The last time I came here, I ended up not having a drink with my dinner because everything I asked for was out. ",
    "Okay, it was a tough winter and there may be more jobs than they can handle. But you don't leave a past client hanging with a leaky roof (that they installed, BTW) by not returning his calls.",
    "Great place for food and drinks in Murray hill. I go here all the time to watch rangers games and all things sports related. Chill bar, great music, accommodating staff and the food is on point -  very underrated. And there's always a deal/promotion. Here's a quick rundown of the food I've eaten there:",
    "Burgers - very good, juicy",
    "Wings - awesome - probably the best and most consistent item on the menu along with the tenders.",
    "Artichoke dip- surprisingly incredible -covered w/bread crumbs ",
    "Mac n cheese - legit", "Route 66 - solid turkey sandwich - ", "Chicken club - can't go wrong",
    "$160 per person. Dining times at 6 or 9pm. Intimate setting for 8 people. Chef Ichimura preps and cuts sushi in front of you. Very traditional sushi, more like Yasuda, no fancy sauces like Gari. Sushi and overall experience ranks up there as top sushi restaurant in NYC but more on the expensive side. ",
    "Potentially a great spot. Oysters were great.",
    "Bar tender opens up his laptop and calls it a night.",
    "Divey little spot up town, great beer  selection, good food, good service on weeknights and weekend afternoons ... and the free burger with every beer is way better than you'd expect. ",
    "I wish I had discovered this place when I was younger. The 22 year old version of myself would have fallen in love and insisted on coming here regularly.",
    "So highlights: live jazz music, $3 cover, people watching spot, decent wine selection, board games,",
    "It was neat to get up there.. Food was ok.. drinks were pricy.. but the view was neat.",
    "I got the buttermilk fried chicken",
    "We had walked by a few Melt Shops around midtown and they peaked our interest. Artisanal grilled cheese shops are nothing new to LA, but most of them are overrated. Melt Shop prices were what we are used to, and they have tons of different menu items to choose from.",
    "Don't even get me started on the pretentious fajita.",
    "...had to listen to them debate if another staff member 'sharted' himself.",
    "This pasta is missing something.",
    "I tried to force myself to eat it all because I spent all the money I had that day on it but I just couldn't do it.",
    "Honestly, I can't say anything about their food because I've never had it.",
    "Like China only closer.",
    "If you want a toasted bagel, go to Texas.",
    "Come for the refried beans! Stay for the burn!",
    "'truejamacan' didn't even know how to spell 'Sorrel.'",
    "If you don't love this place, then your tastebuds are ignorant.",
    "Bad", "3 stars cause the guac tasted good", "I didn't even eat here", "HELP! I'm trapped in a yelp clone and can't get out!!!!!",
    "I like the meat", "Not that great", "Doesnt live up to the hype", "My girlfriend gained 20lbs eating at this place."




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
  50.times do 
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
  150.times do 
    reviews << users.sample.written_comments.create!(
      commentable_type: "Restaurant",
      commentable_id: restaurants.sample.id,
      body: reviews_samples.sample
    )
  end

  200.times do 
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
=======
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
		password: "password"	
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
>>>>>>> newMap
