class RestaurantsController < ApplicationController

  # layout false

  def index
    @users = User.all
    @restaurants = Restaurant.all.page(params[:page]).per(15)

    if request.xhr?
      render :index, layout: false
    end
  end

  def new
    @restaurant = Restaurant.new
    render :new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save

      if params["tag1"]
        tag1 = @restaurant.tags.create({author_id: current_user.id, body: params["tag1"]["body"] })
        tag1.save
      end

      if params["tag2"]
        tag2 = @restaurant.tags.create({author_id: current_user.id, body: params["tag2"]["body"] })
        tag2.save
      end

      redirect_to restaurant_url(@restaurant)
    else
      flash.now[:errors] = @restaurant.errors.full_messages
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
    @users = User.all
    render :edit
  end


  def update
    @users = User.all
    @restaurant = current_user.restaurants.find(params[:id])

    if params["tag1"]["body"] != ""
      if @restaurant.tags.length == 0
        tag1 = @restaurant.tags.create({ author_id: current_user.id, body: params["tag1"]["body"] })
        tag1.save
      else
        @restaurant.tags[0]["body"] = params["tag1"]["body"]
        @restaurant.tags[0].save
      end
    end

    if params["tag2"]["body"] != ""
      if @restaurant.tags.length >= 1
        tag2 = @restaurant.tags.create({ author_id: current_user.id, body: params["tag2"]["body"] })
        tag2.save
      else
        @restaurant.tags[1]["body"] = params["tag2"]["body"]
        @restaurant.tags[1].save
      end
    end

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
      params.require(:restaurant).permit(:name, :street1, :street2, :city, :state, :zip, :avatar, :tag1, :tag2)
    end
end
