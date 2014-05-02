 class Api::SearchesController < ApplicationController

def index

    if params[:search][:user_id] != ""
      user = User.find(params[:search][:user_id])
      @search = user.searches.new(search_params)
    else
      @search = Search.new(search_params)
    end
      @search.save!
      

    if @search.search_params.present?
      category_results = PgSearch.multisearch(@search.search_params).map(&:searchable)
      all_restaurants = []
      category_results.each do |result|
        case result.class.to_s
          when "Restaurant"
            all_restaurants << result
          when "Tag"
            all_restaurants << result.restaurant 
        end 
      end
    else
      all_restaurants = Restaurant.all
    end

    restaurants_uniq = all_restaurants.uniq 

    rest_arr = []

    restaurants_uniq.each do |rest|
      unless rest.longitude == "" || rest.latitude == ""
        rest_arr << rest
      end
    end

    if !@search.start_location.present? || @search.start_location.include?("here" || "near me")
      #@restaurants = @restaurants.nearbys(50)
      near_restaurants = []
      rest_arr.each do |restaurant| 
        if Geocoder::Calculations.distance_between([restaurant.longitude,restaurant.latitude], [@search.current_long, @search.current_lat]) < 20 
          near_restaurants << restaurant
        end
      end
      near_restaurants
        ## when i have better seed data, use "restaurant.nearbys(20)""
    else
      near_restaurants = []
      start = Geocoder.search(@search.start_location)[0].data["geometry"]["location"]
      start_long = start["lng"]
      start_lat = start["lat"]
      rest_arr.each do |restaurant| 
        if Geocoder::Calculations.distance_between([restaurant.longitude,restaurant.latitude], [start_long, start_lat]) < 20 
          near_restaurants << restaurant
        end
      end
      near_restaurants
    end

    if @search.start_location.include?("everywhere") 
      @restaurants = rest_arr
    else
      @restaurants = near_restaurants
    end

    render json: @restaurants

  end


  private

    def search_params
      params.require(:search).permit(:user_id, :search_params, :start_location, :current_long, :current_lat)
    end

 end