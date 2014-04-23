class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		render :new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		# @parent = @restaurant.comments.find(params[:parent_comment_id])
		# @comment = @restaurant.comments.build(comment_params)
		@comment = Comment.new(comment_params)

		if @comment.parent_comment_id
			@comment.restaurant_id = nil
		end

		if @comment.save 
			redirect_to restaurant_url(@restaurant)
		else
			flash[:errors] = @comment.errors.full_messages
			render :new
		end
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
			params.require(:comment).permit(:body, :user_id, :restaurant_id, :body, :parent_comment_id)
		end
end
