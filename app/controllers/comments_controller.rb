class CommentsController < ApplicationController
  layout false

  def new
    @comment = Comment.new
    render :new
  end

  def create
    restaurant = Restaurant.find(params[:comment][:commentable_id]) 

    rating = restaurant.ratings.new(rating: params[:rating], 
                            restaurant_id: params[:restaurant_id], 
                            user_id: current_user ? current_user.id : nil)

    unless (params[:comment][:body] == "" || !current_user)
      restaurant = Restaurant.find(params[:comment][:commentable_id])

      comment = restaurant.comments.new(comment_params)
      comment.user_id = current_user.id
      comment.save!
      rating.comment_id = comment.id
      rating.save!
      # render partial: "restaurants/restaurant", locals: {restaurant: restaurant}
      # redirect_to restaurant 
      # return 
    end
    # render partial: "restaurants/restaurant", locals: {restaurant: restaurant}
    # redirect_to restaurant 

    # if request.xhr?

      # render partial: "comments/form", locals: {
      #                         parent_comment_id: nil,
      #                         commentable_id: restaurant.id, 
      #                         commentable_type: "Restaurant" }

      render partial: "comments/eachcomment", locals: { child_comment: comment }

    # else
    #   redirect_to cats_url
    # end
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
    # redirect_to restaurant 
    render nothing: true
  end


  private
    def comment_params
      params.require(:comment).permit(:body, :parent_comment_id)
    end
end
