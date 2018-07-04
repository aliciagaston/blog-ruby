class PostsController < ApplicationController
  before_action :load_post, only: [:show]
  def index
    @posts = Post.all
  end
  def authorized_attributes
    params
        .require(:post)
        .permit(:title, :image, :lead, :date, :content)
  end

  def load_post
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new authorized_attributes
    @post.save
    redirect_to @post
  end
end
