class EventsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '作成出来ました'
    end
  end

  private
  def post_params
    params.permit(:name, :image, :text)
  end

end
