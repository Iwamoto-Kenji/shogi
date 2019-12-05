class EventsController < ApplicationController
  before_action :set_post,only:[:destroy, :edit, :update]
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(6).search(params[:search])
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
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to root_path
    end
  end

  def search
    @post = Post.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
