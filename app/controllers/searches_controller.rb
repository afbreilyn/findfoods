class SearchesController < ApplicationController

	def new
	end

	def create
		user = User.find(params[:search][:user_id])
		@search = user.searches.new(search_params)
		@search.save!
		redirect_to search_url(@search)
	end

	def show
		@search = Search.find_by_id(params[:id])
	end

	private

	def search_params
		params.require(:search).permit(:user_id, :search_params, :start_location)
	end

end
