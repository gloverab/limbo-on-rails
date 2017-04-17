class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    redirect_to decisions_path
  end

  private

  def vote_params
    params.permit(:option_id, :decision_id).merge(voter_id: current_user.id)
  end
end
