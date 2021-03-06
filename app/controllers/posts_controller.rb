class PostsController < ApplicationController
  def index
    @posts = Post.all
     authorize @post
  end

  def show
      @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic_id = @topic.id
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end


  def new
        @topic = Topic.find(params[:topic_id])
      @post = Post.new
        authorize @post
  end

  def edit
        @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
      authorize @post
  end

  def update
        @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
      authorize @post
      
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to topic_post_path(@topic, @post)
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end


private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
