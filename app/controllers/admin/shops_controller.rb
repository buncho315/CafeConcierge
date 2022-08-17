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
    #desrtoyの中身を書く
    @shop = Shop.find(params[:id])
    # @shop.desrtoy
  end

  def update
  end

end
