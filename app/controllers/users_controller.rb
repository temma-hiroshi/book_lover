class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to home_index_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :image)
    end
end
