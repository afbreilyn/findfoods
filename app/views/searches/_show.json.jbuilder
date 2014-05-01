json.restaurants = @restaurants do |restaurant| 
	json.extract! restaurant, :user_id, :search_params, :start_location, :current_long, :current_lat
end

