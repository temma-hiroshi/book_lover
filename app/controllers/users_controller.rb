class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  # params[:id]では、ログインした本人以外の情報を使用できてしまうため
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to home_index_path
    else
      flash[:alert] = "更新が失敗しました。"
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      flash[:notice] = "削除が完了しました。"
      redirect_to root_path
    else
      flash[:alert] = "削除が失敗しました。"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
