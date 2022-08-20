class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.where(is_deleted: false)

  end

  def show
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

  #強制退会させる
  def withdrawal
    @end_user = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_deleted: true)
    #byebug
    reset_session
    redirect_to admin_end_users_path
  end

  def end_user_params
    params.require(:end_user).permit(:name, :first_name_kana, :email, :telephone_number, :postal_code, :delete)
  end

end
