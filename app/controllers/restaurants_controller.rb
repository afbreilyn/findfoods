class RestaurantsController < ApplicationController

	# layout false

	def index
		@restaurants = Restaurant.all.page(params[:page]).per(15)

		respond_to do |format|
			format.html
			format.js
		end
		# render :index
	end

	def new
		@restaurant = Restaurant.new
		render :new
	end

	def create
		@restaurant = current_user.restaurants.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurant_url(@restaurant)
		else
			flash.now[:errors] = @restaurant.errors.full_messages
			render :new
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		# @geojson = Array.new
		# @geojson << {
		# 	type: 'Feature',
		# 	geometry: {
		# 		type: 'Point',
		# 		coordinates: [@restaurant.longitude, @restaurant.latitude]
		# 	},
		# 	properties: {
		# 		name: @restaurant.name,
		# 		address: @restaurant.average_rating,
		# 		:'marker-color' => '#00607d',
		# 		:'marker-symbol' => 'circle',
		# 		:'marker-size' => 'medium'
		# 	}
		# }

		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @geojson }
		# end
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
		render :edit
	end


	def update
		@restaurant = current_user.restaurants.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_url(@restaurant)
		else
			flash.now[:errors] = @restaurant.errors.full_messages
			render :edit
		end
	end

	def destroy
		@restaurant = current_user.restaurants.find(params[:id])
		@restaurant.destroy
		redirect_to user_url(current_user)
	end


	private
		def restaurant_params
			params.require(:restaurant).permit(:name, :street1, :street2, :city, :state, :zip, :avatar)
		end
end
