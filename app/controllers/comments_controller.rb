class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		render :new
	end

	def create
		@comment = restaurant.comments.new(comment_params)

		if @comment.save 
			redirect_to #somewhere
		else
			flash[:errors] = @comment.errors.full_messages
			render :new
		end
	end

	def edit
		@comment = restaurant.comments.find(params[:id])
	end

	def update
		@comment = restaurant.comments.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to #somewhere
		else
			flash.now[:errors] = @user.errors.full_messages
			render #somewhere
		end
	end
	
	private
		def comment_params
			params.require(:comment).permits(:body, :user_id, :restaurant_id, :body)
		end
end
