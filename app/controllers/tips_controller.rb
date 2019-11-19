class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @tips = policy_scope(Tip)
    @user_votes = current_user.votes
  end

private

  def tip_params
    params.require(:tip).permit(:content, :city, :title, :latitude, :longitude, :status)
  end

  def set_tip
    @tip = Tip.find(params[:id])
    authorize @tip
  end
end
