class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    comment.save
    redirect_to public_shops_path
    #ショップの一覧画面でコメントが反映されてるか見る

    private

    def comment_params
      params.require(:comment).permit(:comment)
    end
    
  end
end
