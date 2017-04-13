class DecisionsController < ApplicationController

  def index
    @decision = Decision.new
    @decisions = Decision.all.order(id: :desc)
  end

  def show
    @decision = Decision.find_by_id(params[:id])
  end

  def new
    if params[:decision]
      params.permit(:title)
      @decision = Decision.new(title: params[:decision][:title])
    else
      @decision = Decision.new(title: "Your Title Here")
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

  private

  def decision_params
    params.require(:decision).permit(:title, :content, :hours, :minutes, :option_1, :option_2, :deadline)
  end

end
