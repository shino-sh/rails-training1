class CommentsController < ApplicationController
  def edit
  end

  # コメント作成
  def new
    id               = params[:post_id]
    @post            = Post.find(id)
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
