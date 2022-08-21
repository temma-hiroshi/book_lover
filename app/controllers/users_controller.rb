class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit]

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to home_index_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
