class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
  end

  def destroy
    @shop = Shop.find(params[:id]).destroy
    flash[:success] = "削除を実行しました！"
    redirect_to admin_end_users_path
    #１件削除が終わったら、admin側のユーザー一覧画面に戻る
  end

  def update
  end

end
