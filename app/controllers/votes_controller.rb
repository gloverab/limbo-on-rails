class VotesController < ApplicationController

  def create
    Vote.find_or_create_by(vote_params)
    redirect_to decisions_path
  end

  private

  def vote_params
    params.permit(:option_id, :decision_id).merge(voter_id: current_user.id)
  end
end
