# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	jonathan = User.create({
		fname: "Jonathan",
		lname: "Tamboer",
		city: "Amsterdam",
		state: "NH",
		email: "jt@email.com",
		password: "password"
		}),

	sennacys_delight = Restaurant.new({ 
		name: "Senaccy's Delight",
		street1: "27 Cooper Square",
		city: "nyc",
		state: "ny",
		zip: 11111,
		owner_id: 1,
		avatar: "http://www.coolfunnyjunk.com/wp-content/uploads/2009/01/happy-cat.jpg"
		})

