class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
    @shops = EndUser.find(params[:id]).shops
  end

  def show
    # @shop = EndUser.find(params[:id]).shops
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end

end
