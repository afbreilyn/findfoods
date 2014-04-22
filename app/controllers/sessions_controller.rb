class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_credentials(
			params[:user][:email],
			params[:user][:password]
		)
		if user
			sign_in(user)
			redirect_to user_url(user)
		else
			flash[:errors] = ["Invalid email or password"]
			render :new
		end
	end

	def destroy
		sign_out
		redirect_to new_session_url
	end

end
