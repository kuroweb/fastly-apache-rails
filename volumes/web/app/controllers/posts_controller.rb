class PostsController < ApplicationController
  before_action :enable_cache

  def index
    @posts = Post.all
  end
end
