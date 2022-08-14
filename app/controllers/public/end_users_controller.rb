class Public::EndUsersController < ApplicationController
  def index
  end

  def new
    @end_user = EndUser.new
  end

  def create
  end

  def show
    # @end_user = EndUser.find(params[:id])
    @shop = Shop.find_by(params[:id])
    #ユーザーIDがないので、とりあえず画面表示するためにfind_by
  end

  def destroy
  end

  private
  def end_user_params
    params.require(:end_user).permit(:title, :body)
  end

end