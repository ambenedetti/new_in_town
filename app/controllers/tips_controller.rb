class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @tips = policy_scope(Tip)
  end

  def new
    @tip = Tip.new
    authorize @tip
  end

  def create
    @tip = Tip.new(tip_params)
    authorize @tip
    @tip.user = current_user
    @tip.status = 0
    @tip.category = Category.find(params[:tip][:category_id])
    if @tip.save
      redirect_to tips_path
    else
      render :new
    end
  end

private

  def tip_params
    params.require(:tip).permit(:content, :city, :title, :latitude, :longitude, :status, :category)
  end

  def set_tip
    @tip = Tip.find(params[:id])
    authorize @tip
  end
end
