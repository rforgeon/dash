class ApplicationController < ActionController::Base

  respond_to :json


#   before_action :configure_permitted_parameters, if: :devise_controller?
#
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  # end

  # before_action :ensure_json_request
  #
  # def ensure_json_request
  #   return if request.format == :json
  #   render :nothing => true, :status => 406
  # end


  protected



end
