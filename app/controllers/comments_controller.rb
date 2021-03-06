class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Your comment was created"
    else
      flash[:error] = "Your comment was not created"
    end

    redirect_to [@topic, @post]

  end
end

  private
     def comment_params
     params.require(:comment).permit(:body)
    end

