class UserCitiesController < ApplicationController

    def index
    if user_signed_in?
    @user = current_user
    @user_cities = policy_scope(UserCity).includes(:user)
    @user_cities = @user.user_cities
    end
  end

  def new
    @user = current_user
    if @user.cities.length > 0
      @cities = @user.cities
    end
    @user_city = UserCity.new
    authorize @user_city
    @no_footer = true
  end

  def create
    @user_city = UserCity.new(user_city_params)
    authorize @user_city
    @user_city.user = current_user
    if @user_city.save
      redirect_to new_user_city_path
    else
      redirect_to new_user_city_path
      flash[:alert] = "Type and select a new city"
    end
  end

  def destroy
    @user_city = UserCity.find(params[:id])
    @user = current_user
    @user_city.destroy
    authorize @user_city
    redirect_to new_user_city_path
  end

  private
  def user_city_params
    params.require(:user_city).permit(:city, :country, :latitude, :longitude, :user_id)
  end

  def set_user_city
    @user_city = UserCity.find(params[:id])
    authorize @user_city
  end
end
