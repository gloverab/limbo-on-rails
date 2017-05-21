class DecisionsController < ApplicationController
  before_action :set_discussions

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @decisions = @user.decisions.order(id: :desc)
    else
      @decisions = Decision.all.order(id: :desc).limit(20)
    end
    @decision = Decision.new
  end

  def show
    @decision = Decision.find_by_id(params[:id])
  end

  def new
    @decision = Decision.new(title: params[:title] || "Your Question Here")
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @decision = Decision.new(decision_params)
    @decision.deadline = @decision.deadline_calculator
    @decision.author = current_user

    respond_to do |format|
      if @decision.save
        format.html
        format.js
      else
        flash[:notice] = "Please fill in all the required fields!"
      end
    end
  end

  def edit
    @decision = Decision.find_by_id(params[:id])
  end

  def update
    @decision = Decision.find_by_id(params[:id])
    @decision.update(decision_params)
    redirect_to root_path
  end

  def destroy
    @decision = Decision.find_by_id(params[:id])
    @decision.destroy
    redirect_to decisions_path, notice: "You've successfully deleted your past dilemma."
  end

  private

  def decision_params
    params.require(:decision).permit(:title, :content, :hours, :minutes, :option_1, :option_2, :created_at, :updated_at, :deadline, :options_attributes => [:content])
  end

  def set_discussions
    @discussions = Discussion.all.limit(5)
  end

end
