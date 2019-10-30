class EventsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def create
    # binding.pry
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
