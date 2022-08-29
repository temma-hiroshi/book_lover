class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def search
    @results = @search.result.includes(:image_attachment)
  end

  def guest_sign_in
    user = User.find_or_create_by!(name: "guestuser",email: "guestuser@example.com") do |user|
      user.password = "hogehoge"
    end
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path

  end

  private

  def set_search
    @search = Book.ransack(params[:q])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
