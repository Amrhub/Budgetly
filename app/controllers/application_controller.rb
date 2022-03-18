class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  add_flash_types :danger, :info, :warning, :success

  def request_path
    request.path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :avatar, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :avatar, :email, :password, :current_password)
    end
  end
end
