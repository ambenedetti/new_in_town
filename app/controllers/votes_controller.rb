class VotesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @tip = Tip.find(params[:tip_id])
    @user_votes = user_votes

    existing = @user_votes.find_by(tip: @tip)

    if existing
      authorize existing
      existing.destroy
    else
      @vote = Vote.new(vote_params)
      @vote.tip = @tip
      @user = current_user if user_signed_in?
      @vote.user = @user
      @vote.guest = cookies[:guest] if !user_signed_in?
      @vote.save!
      authorize @vote
    end
  end

  private

  def user_votes
    if user_signed_in?
      current_user.votes
    else
      Vote.where(guest: cookies[:guest])
    end
  end

  def vote_params
    params.require(:vote).permit(:direction)
  end
end
