class Public::SessionsController < Devise::SessionsController

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest_sign_in
    user = EndUser.guest
    sign_in user
    redirect_to public_shops_path, notice: 'ゲストユーザーでログインしました。'
  end
end
