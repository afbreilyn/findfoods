class UsersController < ApplicationController

	def new
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
	end

	def edit
	end

	def delete
	end

	private
		def user_params
			params.require(:user).permit(:fname, :mname, :lname, :email, :city, :state, :password)
		end
end
