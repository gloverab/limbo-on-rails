class UsersController < ApplicationController
  before_action :set_discussions

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

  def image_select
    current_user.update(image_path: params[:image_path])
    redirect_to edit_user_registration_path
  end

  private

  def set_discussions
    @discussions = Discussion.all.limit(5)
  end

end
