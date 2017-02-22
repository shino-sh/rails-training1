class CommentsController < ApplicationController
  def edit
    @post        = Post.find(params[:post_id])
    @comment     = Comment.find(params[:id])
  end
  
  def update
    @comment      = Comment.find(params[:id])
    @post         = Post.find(params[:comment][:post_id])
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@post), {notice: "編集が完了しました"}
    else
      redirect_to :back, notice: "編集に失敗しました"
    end 
  end

  # コメント作成
  def new
    @post            = Post.find(params[:post_id])
    @comment         = @post.comments.build
  end
  
  def create
    @comment      = Comment.new(comment_params)
    @post         = Post.find(params[:comment][:post_id])
    if @comment.save
      redirect_to post_path(@post), {notice: "投稿が完了しました"}
    else
      redirect_to :back, notice: "投稿に失敗しました"
    end 
  end
  
  private def comment_params
    params.require(:comment).permit(:name, :content, :post_id)
  end

  def destroy
    id = params[:id]
    Comment.find(id).destroy
    flash[:success] = "削除しました"
    redirect_to :back
  end
end
