class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
    #@shops = EndUser.find(params[:id]).shops
  end

  def show
    # @shop = EndUser.find(params[:id]).shops
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.with_deleted.find(params[:id])
  end

  def update
    @end_user = EndUser.with_deleted.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:success] = '編集しました'
      redirect_to admins_end_user_path(@end_user.id)
    else
      flash[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  # def end_user_status_update
  #   @end_user = EndUser.find(params[:id])
  #   if @end_user.update
  #     flash[:success] = "会員ステータスを更新しました"
  #     end_user_status_is_deposited?(@end_user)
  #     redirect_back(fallback_location: admin_end_user_path)
  #   else
  #     flash[:danger] = "会員ステータスの更新に失敗しました"
  #     redirect_back(fallback_location: admin_end_user_path)
  #   end
  # end

  #強制退会させる
  def withdrawal
    @end_user = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(delete: true)
    reset_session
    flash[:notice] = "退会処理を強制実行いたしました"
    redirect_to public_homes_top_path
  end

  def end_user_params
    params.require(:end_user).permit(:name, :first_name_kana, :email, :telephone_number, :postal_code, :delete)
  end

end
