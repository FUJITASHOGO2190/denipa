class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy]

  def show
    @name = current_user.name
    @posts = current_user.posts
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user.id)
  end

end
