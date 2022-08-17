class Public::EndUsersController < ApplicationController
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

  def destroy
  end

  private
  def end_user_params
    params.require(:end_user).permit(:title, :body)
  end

end