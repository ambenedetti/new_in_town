class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    cookies[:guest] ||= SecureRandom.hex(10)
    @tips = policy_scope(Tip).includes(:votes).includes(:user)
    if user_signed_in?
      @user_votes = current_user.votes.load
    else
      @user_votes = Vote.where(guest: cookies[:guest]).load
    end
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

  def edit
    set_tip
  end

  def update
    set_tip
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to tips_path, notice: "#{@tip.title} was successfully updated." }
        format.json { render :index, status: :ok, location: tips_path }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
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
