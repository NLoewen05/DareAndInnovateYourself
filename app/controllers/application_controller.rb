class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :global_variables

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  def global_variables
    @categories = Category.all
  end
  
end
