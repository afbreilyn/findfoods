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
		@restaurants = Restaurant.all.page(params[:page]).per(10)
	end

	def index

	end

	private

	def search_params
		params.require(:search).permit(:user_id, :search_params, :start_location)
	end

end
