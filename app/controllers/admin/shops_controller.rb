class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shops = Shop..find(params[:id])
  end

  def edit
  end

  def update
  end

end
