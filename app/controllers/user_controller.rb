class UserController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			sign_in(@user)
			redirect_to #somewhere??
		else
			flash[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def show
		@user = User.find_by(:id)
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
