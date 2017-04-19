class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:splash]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def splash
    redirect_to decisions_path if current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :age])
  end

end
