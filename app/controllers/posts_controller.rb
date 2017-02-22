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
    @post = Post.find(params[:id])
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
      render :new
    end 
  end
  
  def update
    @post      = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_path, notice: "投稿が完了しました"
    else
      redirect_to :back, notice: "編集に失敗しました"
    end 
  end
  
  # StrongParamater rails4から
  # paramが:postというキーを持ち，titleとcontentを持っている
  private def post_params
    params.require(:post).permit(:title, :content)
  end

  def destroy
    id          = params[:id]
    Post.find(id).destroy
    redirect_to root_path, notice: "削除しました" 
  end
end