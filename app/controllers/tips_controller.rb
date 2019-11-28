class TipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    cookies[:guest] ||= SecureRandom.hex(10)
    tip_ids = params[:ids]&.split(',')

    @categories = Category.all

    @tips = policy_scope(Tip).includes(:votes).includes(:user)
    @tips = @tips.where(id: tip_ids) #if tip_ids.any?
    @tips = @tips.order(upvote_count: :desc)
  end

  def new
    @tip = Tip.new
    authorize @tip

    @question = Question.find_by(id: params[:question_id])
  end

  def create
    @tip = Tip.new(tip_params)
    authorize @tip
    @tip.user = current_user
    @tip.status = 0
    @question = Question.find_by(id: params[:question_id])

    if @question.present?
      @tip.question = @question
      @tip.category = @question.category
      @tip.city = @question.city
      @tip.country = @question.country
      @tip.latitude = @question.latitude
      @tip.longitude = @question.longitude
    end

    if filter_hateful_language
      render :new
    elsif @tip.save

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
    @mytips = @tips.where(user: @user.id)
    authorize @mytips
    @mytips = @mytips.order('created_at DESC')
  end

  def filter_hateful_language
    profanity_filter = LanguageFilter::Filter.new matchlist: :profanity
    if profanity_filter.match? @tip.content then
      flash[:alert] = "You cannot use this language"
    end
  end

private

  def tip_params
    params.require(:tip).permit(:content, :city, :title, :country, :latitude, :longitude, :status, :category_id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
    authorize @tip
  end
end
