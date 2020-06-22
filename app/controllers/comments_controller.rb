class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to item_path(@comment.item)
  end

  def destroy
    @comment = Comment.find(params[:id])
    item = @comment.item
    @comment.destroy
    redirect_to item_path(item)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :item_id)
    end
end
