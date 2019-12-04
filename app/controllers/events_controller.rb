class EventsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '作成出来ました'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end
