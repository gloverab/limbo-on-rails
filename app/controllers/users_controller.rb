class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def avatar_select
    current_user.update(avatar: params[:avatar])
    # binding.pry
    redirect_to edit_user_registration_path
  end
end
