class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  # rescue_from CanCan::AccessDenied do |exception|
  #   Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  #   # ...
  # end

  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json { head :forbidden }
  #     format.html { redirect_to '/', :alert => exception.message }
  #end
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:matricula, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys:  [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
