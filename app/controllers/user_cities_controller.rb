class UserCitiesController < ApplicationController
    def index
    if user_signed_in?
    @user = current_user
    @user_cities = policy_scope(UserCity).includes(:user)
    @user_cities = @user.user_cities
    end
  end

  def new
    @user_city = UserCity.new
    authorize @user_city
  end

  def create
    @user_city = UserCity.new(user_city_params)
    authorize @user_city
    @user_city.user = current_user
    if @user_city.save
      redirect_to new_user_city_path
    else
      render :new
    end
  end

  private
  def user_city_params
    params.require(:user_city).permit(:name, :user_id)
  end

  def set_user_city
    @user_city = UserCity.find(params[:id])
    authorize @user_city
  end
end
