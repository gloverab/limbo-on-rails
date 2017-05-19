class VotesController < ApplicationController

  def create
    decision = Decision.find_by_id(params[:decision_id])
    if !current_user.decisions.include?(decision)
      vote = Vote.where(
        voter_id: current_user.id,
        decision_id: vote_params[:decision_id]
      ).first_or_create

      vote.update(persuasion: vote_params[:persuasion])
    end
    render json: decision
  end

  private

  def vote_params
    params.permit(:persuasion, :decision_id).merge(voter_id: current_user.id)
  end
end
