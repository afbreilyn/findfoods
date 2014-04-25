class UsersController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			sign_in(@user)
			redirect_to user_url(@user)
		else
			flash[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		# @user.notifications.each(&:read!)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_url(@user)
		else
			flash.now[:errors] = @user.errors.full_messages
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to new_session_url
	end

	private
		def user_params
			params.require(:user).permit(:fname, :mname, :lname, :email, :city, :state, :password)
		end
end
