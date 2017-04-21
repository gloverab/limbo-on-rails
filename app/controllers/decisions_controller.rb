class DecisionsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @decisions = @user.decisions.order(id: :desc)
    else
      @decisions = Decision.all.order(id: :desc)
    end
    @decision = Decision.new
  end

  def show
    @decision = Decision.find_by_id(params[:id])
  end

  def new
    @decision = Decision.new(title: params[:title] || "Your Question Here")
  end

  def create
    @decision = Decision.new(decision_params)
    @decision.deadline = @decision.deadline_calculator
    @decision.author = current_user
    # binding.pry
    if @decision.save
      redirect_to decisions_path
    else
      flash[:notice] = "Uh oh! Looks like you didn't fill everything in. Please have a second look, and we'll be happy to help you make up your mind."
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
    params.require(:decision).permit(:title, :content, :hours, :minutes, :option_1, :option_2, :deadline, :options_attributes => [:content])
  end

end
