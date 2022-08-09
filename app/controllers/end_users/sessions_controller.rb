class EndUsers::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = EndUser.guest
    sign_in user
    redirect_to ens_user_path(user), notice: 'guestuserでログインしました。'
  end
end
