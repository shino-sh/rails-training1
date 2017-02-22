class CommentsController < ApplicationController
  def edit
  end

  def create
  end

  def delete
    id = params[:id]
    Comment.find(id).destroy
    flash[:success] = "削除しました"
    redirect_to :back
  end
end
