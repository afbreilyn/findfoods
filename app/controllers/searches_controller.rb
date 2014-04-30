class SearchesController < ApplicationController

	def new
	end

	def create
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

		@restaurants.uniq 

		#= Restaurant.all.page(params[:page]).per(10)
	end

	def index

	end

	private

	def search_params
		params.require(:search).permit(:user_id, :search_params, :start_location)
	end

end
