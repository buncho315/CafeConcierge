class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
    @shop = Shop.find(params[:id]).destroy
    flash[:success] = "削除を実行しました！"
    redirect_to admin_shops_path
  end

  def update
  end

end
