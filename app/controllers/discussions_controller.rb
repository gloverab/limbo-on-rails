class DiscussionsController < ApplicationController

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
    @discussion.build_decision
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.decision.deadline = @discussion.decision.deadline_calculator
    @discussion.author = current_user
    @discussion.decision.author = current_user
    if @discussion.save
      redirect_to decisions_path
    else
      flash[:notice] = "Please fill in all the required fields!"
      redirect_to :back
    end
  end

  def show
    @discussion = Discussion.find_by_id(params[:id])
    @reply = @discussion.replies.build
  end

  def update
    @discussion = Discussion.find_by_id(params[:id])
    @discussion.replies.build(author: current_user, content: params[:discussion][:reply][:content])
    @discussion.save
    redirect_to @discussion
  end

  private

  def discussion_params
    params.require(:discussion).permit(:reason, decision_attributes:[:title, :content, :option_1, :option_2, :hours, :minutes])
  end

  def reply_params
    params.require(:discussion).permit()
  end
end
