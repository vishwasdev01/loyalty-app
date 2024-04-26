class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :phone_number, :country, :date_of_birth, :points)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, :phone_number, :country, :date_of_birth, :points)}
  end
end
