class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if user_signed_in? && current_user.id == @comment.user_id
      @comment.destroy
      redirect_to item_path(params[:item_id])
    else
      redirect_to item_path(params[:item_id]), alert: :'ログイン済みのコメント投稿者本人のみがコメントを削除できます'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
