class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def show
    @shop = Shop.find(params[:id])
    #コメント投稿用
    @comments = Comment.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.end_user_id = current_end_user.id
    if @shop.save
      redirect_to  public_shops_path
    else
      render :new
    end
  end

    private
  def shop_params
    params.require(:shop).permit(:title, :body, :image)
  end
end
