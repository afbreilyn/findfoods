class SearchesController < ApplicationController

	def new
	end

	def create

		#### MAKE AND SAVE THE SEARCH ####
		
		if params[:search][:user_id] != ""
			user = User.find(params[:search][:user_id])
			@search = user.searches.new(search_params)
		else
			@search = Search.new(search_params)
		end
			@search.save!
			
		redirect_to search_url(@search)

	end

	def show
		@search = Search.find_by_id(params[:id])

		if params[:search_params].present?
			category_results = PgSearch.multisearch(@search.search_params).map(&:searchable)

			@restaurants = []
			category_results.each do |result|
				case result.class.to_s
					when "Restaurant"
						@restaurants << result
					when "Tag"
						@restaurants << result.restaurant 
				end	
			end
		else
			@restaurants = Restaurant.all
		end

		@restaurants = @restaurants.uniq 

		if !params[:start_location].present? || params[:start_location].include?("here" || "near me")
			#@restaurants = @restaurants.nearbys(50)
			@restaurants = Restaurant.all
		else
			@restaurants = @restaurants.near[@search.start_location, 50, :order => :distance]
		end

	end


	def index

	end

	private

	def search_params
		params.require(:search).permit(:user_id, :search_params, :start_location, :current_long, :current_lat)
	end

end
