class EventsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      binding.pry
      redirect_to root_path, notice: '作成出来ました'
    end
  end

  # def create
  #   Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  # end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    end
  end

  def edit
    @posts = Post.find(params[:id])
  end

  private
  def post_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end
