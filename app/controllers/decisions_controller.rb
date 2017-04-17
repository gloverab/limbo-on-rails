class DecisionsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @decision = Decision.new
      @decisions = @user.decisions.order(id: :desc)
    else
      @decision = Decision.new
      @decisions = Decision.all.order(id: :desc)
    end
  end

  def show
    @decision = Decision.find_by_id(params[:id])
  end

  def new
    if params[:decision]
      params.permit(:title)
      @decision = Decision.new(title: params[:decision][:title])
      @decision.options.build(choice_number: 1)
      @decision.options.build(choice_number: 2)
    else
      @decision = Decision.new(title: "Your Title Here")
      @decision.options.build(choice_number: 1)
      @decision.options.build(choice_number: 2)
    end
  end

  def new_from_index
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
