class PostsController < ApplicationController
  before_action :enable_cache

  def index
    @posts = Post.all
  end

  def show
    render json: Post.find(params[:id])
  end
end
