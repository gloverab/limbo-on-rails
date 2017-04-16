class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def avatar_select
    current_user.update(avatar: Avatar.find_by_id(params[:avatar_id]))
    redirect_to edit_user_registration_path
  end
end
