class Public::CommentsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments
  end

  def create
    comment = current_user.comments.new(comment_params)
    comment.save
    redirect_to public_shops_path
    #ショップの一覧画面でコメントが反映されてるか見る
  end

  def destroy
    Comment.find(params:[:id]).destroy
    redirect_to public_comment_path(params[:comment_id])
  end

    private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
