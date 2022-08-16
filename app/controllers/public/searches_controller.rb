class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    #駅名か店名で検索できるようにしたい
    # @range = params[:range]
    # if @range == "EndUser"
    #   @end_users = EndUser.looks(params[:search], params[:keyword])
    # else
    #   @shops = Shop.looks(params[:search], params[:keyword])
    # end
  end
end
