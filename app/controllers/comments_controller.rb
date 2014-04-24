class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		render :new
	end

	def create
		restaurant = Restaurant.find(params[:comment][:commentable_id])
		unless params[:comment][:body] == "" || !current_user
			if params[:comment][:commentable_type] == "Restaurant" 
				restaurant = Restaurant.find(params[:comment][:commentable_id])

				comment = restaurant.comments.new(comment_params)
				comment.user_id = current_user.id
				comment.save!
				redirect_to restaurant 
				return 
			end
		end
		redirect_to restaurant
	end

	def edit
		@comment = Comments.find(params[:id])
	end

	def update
		@comment = Comments.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to #somewhere
		else
			flash.now[:errors] = @user.errors.full_messages
			render #somewhere
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		restaurant = Restaurant.find(@comment.commentable_id)
		@comment.destroy
		redirect_to restaurant 
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :parent_comment_id)
		end
end
