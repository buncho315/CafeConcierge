class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
    @shops = EndUser.find(params[:id]).shops
  end

  def show
    # @shop = EndUser.find(params[:id]).shops
    @end_user = EndUser.find(params[:id])
  end
  
  def end_user_status_update
    @end_user = EndUser.find(params[:id])
    if @end_user.update
      flash[:success] = "会員ステータスを更新しました"
      end_user_status_is_deposited?(@end_user)
      redirect_back(fallback_location: admin_end_user_path)
    else
      flash[:danger] = "会員ステータスの更新に失敗しました"
      redirect_back(fallback_location: admin_end_user_path)
    end
  end
  

  def edit
  end

  def update
  end

end
