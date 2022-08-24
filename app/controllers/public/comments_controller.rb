class Public::CommentsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments
  end

  def create
    @comment = current_end_user.comments.new(comment_params)
    @comment.shop_id = params[:shop_id]
    @comment.save
    redirect_to public_shop_comments_path
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_shop_comments_path(params[:shop_id])
  end

    private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
