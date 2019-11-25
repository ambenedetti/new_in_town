class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    cookies[:guest] ||= SecureRandom.hex(10)
    tip_ids = params[:ids]&.split(',') || []
    @categories = Category.all
    @tips = policy_scope(Tip).includes(:votes).includes(:user)
    @tips = @tips.where(id: tip_ids) if tip_ids.any?
    @tips = @tips.order(upvote_count: :desc)
    if user_signed_in?
      @user_votes = current_user.votes.load
    else
      @user_votes = Vote.where(guest: cookies[:guest]).load
    end
    @count = @tips.count
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
    if @tip.save
      redirect_to mytips_path
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

  def mytips
    @user = current_user
    @tips = Tip.all
    @user_votes = current_user.votes.load
    @mytips = @tips.where(user: @user.id)
    authorize @mytips
    @mytips = @mytips.order('created_at DESC')
  end

private

  def tip_params
    params.require(:tip).permit(:content, :city, :title, :latitude, :longitude, :status, :category_id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
    authorize @tip
  end
end
