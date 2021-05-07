class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(opinion_id: params[:opinion_id])

    redirect_back fallback_location: '/' if @vote.save
  end
end
