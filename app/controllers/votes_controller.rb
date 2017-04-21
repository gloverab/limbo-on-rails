class VotesController < ApplicationController

  def create
    decision = Decision.find_by_id(params[:decision_id])
    if !current_user.decisions.include?(decision)
      vote = Vote.where(
        voter_id: current_user.id,
        decision_id: vote_params[:decision_id]
      ).first_or_create
      flash[:notice] = "You just updated your vote!" if !vote.persuasion.nil?
      vote.update(persuasion: vote_params[:persuasion])
    else
      flash[:notice] = "You can't vote on your own dilemma!"
    end
    redirect_to decisions_path
  end

  private

  def vote_params
    params.permit(:persuasion, :decision_id).merge(voter_id: current_user.id)
  end
end
