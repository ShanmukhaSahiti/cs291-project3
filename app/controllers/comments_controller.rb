class CommentsController < ApplicationController
  before_action :require_author, only: [ :create ]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: params[:comment][:body], commenter: current_user.username)
    redirect_to post_path(@post)
  end

  private

  def require_author
    unless current_user.username != nil
      redirect_to posts_path, alert: "You are not authorized to perform this action."
    end
  end
end
