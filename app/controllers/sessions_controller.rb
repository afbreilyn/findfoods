class SessionsController < ApplicationController
  # before_action :require_! only: [:destroy] 
  # before_action :require_current_user! only: [:destroy] 

  layout false

  def new
    @users = User.all
    @restaurants = Restaurant.all
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      sign_in(user)
      redirect_to root_url
    else
      flash[:errors] = ["Invalid email or password"]
      # render :new
      redirect_to root_url
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
