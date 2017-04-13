class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:splash]

  def splash
    redirect_to decisions_path if current_user
  end
end
