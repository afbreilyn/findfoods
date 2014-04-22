class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_email_and_password(
			params[:user][:email],
			params[:user][:password]
		)
		if user
			sign_in(user)
			# redirect_to 'somewhere'
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
