class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!
  helper_method :element_present?

  def element_present?(element)
    if element.nil? || element.empty?
      return false
    else
      return true
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:f_name, :l_name, :email, :password, :password_confirmation) }
  end
end
