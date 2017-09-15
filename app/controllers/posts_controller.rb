class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_parms)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_parms
      params.require(:post).permit(:title, :body, :image)
    end
end
