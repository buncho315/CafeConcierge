class Public::FavoritesController < ApplicationController
  before_action :shop_params

  def create
    Favorite.create(end_user_id: current_end_user.id, shop_id: params[:shop_id])
  end

  def destroy
    Favorite.find_by(end_user_id: current_end_user.id, shop_id: params[:shop_id]).destroy
  end

  private

 def shop_params
   #binding.pry
   @shop = Shop.find(params[:shop_id])
 end

end
