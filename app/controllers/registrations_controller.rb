class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = "Thanks for signing up! Take a second to make your profile a little more personal."
    edit_user_registration_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
