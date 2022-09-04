class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(@post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
