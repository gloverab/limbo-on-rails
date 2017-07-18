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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user}
    end
  end

  private

  def set_discussions
    @discussions = Discussion.all.limit(5)
  end

end
