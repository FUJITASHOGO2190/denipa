class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]

  def index
    @posts = Post.all.order('created_at DESC')
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
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :washing_frequency, :wearing_years, :brand_id, :image).merge(user_id: current_user.id)
  end
end
