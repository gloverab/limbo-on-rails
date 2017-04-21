class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
     @user = User.from_omniauth(request.env["omniauth.auth"])
    #  binding.pry
     sign_in @user
     if @user.username
       redirect_to root_path
     else
       redirect_to edit_user_registration_path
     end
  end

end
