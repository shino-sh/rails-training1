class PostsController < ApplicationController
  
  # ブログ一覧表示
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def create
  end

  def delete
  end
end
