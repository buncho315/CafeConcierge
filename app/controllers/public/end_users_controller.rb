class Public::EndUsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def index
  end

  def new
    @end_user = EndUser.new
  end

  def create
  end

  def show
    @shops = EndUser.find(params[:id]).shops
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    if @end_user.save
      flash[:notice] = "更新成功です！"
      redirect_to end_user_path(@end_user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @end_user = current_end_user
  end

  def withdrawal
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会は成功しました！"
    redirect_to root_path
  end

  def destroy
  end

  private

  def end_user_params
    params.require(:end_user).permit(:title, :body, :profile_image)
  end

  #ゲストユーザー
  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      redirect_to end_user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end