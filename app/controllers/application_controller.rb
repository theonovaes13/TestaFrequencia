class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json { head :forbidden }
  #     format.html { redirect_to root_path, :alert => exception.message }
  #   end
  # end

  def after_sign_in_path_for(resource)
    users_path
  end
end
