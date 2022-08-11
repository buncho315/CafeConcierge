class Public::EndUsersController < ApplicationController
  def index
  end

  def new
    @end_user = EndUser.new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
  def end_user_params
    params.require(:end_user).permit(:title, :body)
  end

end