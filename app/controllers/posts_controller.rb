class PostsController < ApplicationController
  
  # ブログ一覧表示
  def index
    @posts     = Post.all
  end

  def show
    id         = params[:id]
    @post      = Post.find(id)
    @comments  = @post.comments.all
  end

  def edit
  end
  
  # 記事作成
  def new
    @post      = Post.new
  end
  
  # routeにpostを追加する
  def create
    @post      = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が完了しました"
    else
      redirect_to :back, notice: "投稿に失敗しました"
    end 
  end
  
  def update
  end
  
  # StrongParamater rails4から
  # paramが:postというキーを持ち，titleとcontentを持っている
  private def post_params
    params.require(:post).permit(:title, :content)
  end

  def delete
    id          = params[:id]
    Post.find(id).destroy
    redirect_to root_path, notice: "削除しました" 
  end
end