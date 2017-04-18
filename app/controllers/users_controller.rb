class UsersController < ApplicationController

  def index
    @users = User.by_signup
  end

  def most_indecisive
    @users = User.most_indecisive
    render template: 'users/index'
  end

  def most_decisive
    @users = User.most_decisive
    render template: 'users/index'
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def avatar_select
    current_user.update(avatar: Avatar.find_by_id(params[:avatar_id]))
    redirect_to edit_user_registration_path
  end
end
