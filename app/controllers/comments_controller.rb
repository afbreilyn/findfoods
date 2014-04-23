class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		render :new
	end

	def create

		if params[:comment][:commentable_type] == "Restaurant" 
			restaurant = Restaurant.find(params[:comment][:commentable_id])

			comment = restaurant.comments.new(comment_params)
			comment.user_id = current_user.id

			comment.save!
			redirect_to restaurant 
			return 
		end
		
		redirect_to root_url
	end

	def edit
		@comment = Restaurant.comments.find(params[:id])
	end

	def update
		@comment = Restaurant.comments.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to #somewhere
		else
			flash.now[:errors] = @user.errors.full_messages
			render #somewhere
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find(params[:id])
		@comment.destroy
		redirect_to restaurant_url(@comment.restaurant_id)
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :comment_parent_comment_id)
		end
end
