class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :update_allowed_parameters, if: :devise_controller?
  add_flash_types :danger, :info, :warning, :success

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :avatar, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :avatar, :email, :password, :current_password)
    end
  end
end
