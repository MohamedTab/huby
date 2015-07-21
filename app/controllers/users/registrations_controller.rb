class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :status) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
  end

end
