class RepliesController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    reply = Reply.find_by_id(params[:id])
    discussion = reply.discussion
    reply.destroy!
    redirect_to discussion
  end
end
