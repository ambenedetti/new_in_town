class VotesController < ApplicationController
  def create
    @tip = Tip.find(params[:tip_id])
    @user_votes = current_user.votes
    existing = current_user.votes.find_by(tip: @tip)
    if existing
      authorize existing
      existing.destroy
    else
      @vote = Vote.new(vote_params)
      @vote.tip = @tip
      @vote.user = current_user
      @vote.save
      authorize @vote
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:direction)
  end
end
