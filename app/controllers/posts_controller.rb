class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :require_author, only: [ :edit, :update, :destroy ]
  skip_before_action :require_login, only: [ :index ]

  def index
    @posts = Post.order(updated_at: :desc)
    @post = Post.new
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.username

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def require_author
    unless @post.author == current_user.username
      redirect_to post_path, alert: "You are not authorized to perform this action."
    end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
