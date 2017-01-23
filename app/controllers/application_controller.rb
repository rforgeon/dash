class ApplicationController < ActionController::Base

#   before_action :configure_permitted_parameters, if: :devise_controller?
#
# def configure_permitted_parameters
#   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
# end
  respond_to :html,:json


  protected



end
