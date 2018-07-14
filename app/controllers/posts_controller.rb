class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :destroy]
  before_action :logged_in_user_equal_to_currentuser, only: [:edit, :destroy]
  before_action :logged_in_user, only: [:new]

  def authorized_attributes
    params
        .require(:post)
        .permit(:title, :file, :lead, :content, :user_id)
  end

  def create
    @post = Post.new authorized_attributes
    @post.user_id = current_user.id
    @post.date = Time.now
    puts @post.inspect
    puts current_user.inspect
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def destroy
    @post.destroy
    redirect_to @posts
  end

  def index
    @posts = Post.all.order('id desc')
  end

  def load_post
    @post = Post.find params[:id]
  end

  def logged_in_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def logged_in_user_equal_to_currentuser
    unless user_signed_in? && @post.user_id == current_user.id
      redirect_to new_user_session_path
    end
  end

  def new
    @post = Post.new
  end

  def update
    if @post.user && @post.user == current_user
      if @post.update authorized_attributes
        redirect_to @post
      else
        render "edit"
      end
    end
  else
    redirect_to @post
  end

end
