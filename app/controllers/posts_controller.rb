class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :search

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
    else
      redirect_to root_path
    end
  end
 
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(post_params)
    else
      render 'edit'
    end
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

  private
  def post_params
    params.require(:post).permit(:content, :washing_frequency, :wearing_years, :brand_id, {images: []}).merge(user_id: current_user.id)
  end
end
