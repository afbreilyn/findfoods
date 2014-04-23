module CommentsHelper
	  def comment_partial(comment_id, comments_by_parent)
    render(
      partial: "comments/comment",
      locals: {
        :comment_id => comment_id,
        :comments_by_parent => comments_by_parent
      }
    )
  end
end


