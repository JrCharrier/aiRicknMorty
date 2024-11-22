class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :avatar])
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end
