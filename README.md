# FINDFOODS: 

[FindFoods](http://www.findfoods.org) is a clone of [yelp](http://www.yelp.com). It was built by me, [Aaron Foster Bresley](https://www.linkedin.com/pub/aaron-foster-bresley/37/54a/146/), in Spring 2014.  Go check it out: http://www.findfoods.org!


## Features

Findfoods contains the core of yelp's functionality, with a few added touches. Visitors are able to:

* Search for restaurants by category, place, and title
* View and refine results by ranking
* Create, edit, and destroy accounts
* Rank and write reviews of restaurants
* Users can create and edit their own restaurants
* Each restaurant owner receives notifications when their restaurant receives a review using polymorphic associations


## Cool little details

* The search map defaults to the computers current location.
* Hand built user/session authentication system
* All the reviews are real, believe it or not! Well... there's one easter egg, but you didn't hear it from me. 


## Technologies used

* Framework was built in Ruby on Rails
* Restaurant searches (and basic navigation) employ Unobtrusive JavaScript for a smooth user experience, and to minimize queries to the database
* Employs the JavaScript MapBox API to display restaurants locations
* CSS styling was done without outside stylesheet or tools


## Yet-to-be-implemented Features

* Nested comments (the structure is there - just need to do the styling)
* Direction messaging between users
* Email/Text verification upon user account creation
* Ability to "favourite" restaurants, and for restaurants to send email blasts
* Have the database not only look at fake data, but also use GoogleMaps API
