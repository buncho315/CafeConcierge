class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
    @genres = Genre.where(is_enabled: true)
  end

  def show
    @shop = Shop.find(params[:id])
    @comments = Comment.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.end_user_id = current_end_user.id
    if @shop.save
      redirect_to  public_shops_path
    else
      @genres = Genre.where(is_enabled: true)
      render :new
    end
  end

    private
  def shop_params
    params.require(:shop).permit(:title, :body, :image, :access, :rate, genre_ids: [])
  end
end
