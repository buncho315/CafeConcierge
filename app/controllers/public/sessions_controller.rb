class Public::SessionsController < Devise::SessionsController

  before_action :check_admin, only: [:create]

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest_sign_in
    user = EndUser.guest
    sign_in user
    redirect_to public_shops_path, notice: 'ゲストユーザーでログインしました。'
  end

  def check_admin
    if admin_signed_in?
      redirect_to root_path, notice: '管理者ですでにログインしています。'
      return
    end
  end
end
