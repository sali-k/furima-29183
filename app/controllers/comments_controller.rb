class CommentsController < ApplicationController

  def new
    @comments = Comment.all
    @comment = Ccommen.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
