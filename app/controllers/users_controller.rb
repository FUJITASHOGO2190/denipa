class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy]
  before_action :search

  def show
    @name = current_user.name
    @posts = current_user.posts.order('created_at DESC')
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user.id)
  end

  def search
    @q = Post.ransack(params[:q])
    @items = @q.result.order('created_at DESC')
  end


end
