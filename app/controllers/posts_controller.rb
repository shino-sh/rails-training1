class PostsController < ApplicationController
  
  # ブログ一覧表示
  def index
    @posts     = Post.all
  end

  def show
    id = params[:id]
    @post      = Post.find(id)
    @comments  = @post.comments.all
  end

  def edit
  end

  def create
  end

  def delete
  end
end
