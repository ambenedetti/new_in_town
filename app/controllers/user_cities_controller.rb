class UserCitiesController < ApplicationController
  def new
    @user_city = UserCity.new
    authorize @user_city
  end

  def create
    @user_city = UserCity.new(user_city_params)
    @user_city.user = current_user
    @user_city.save
    redirect_to tips_path
    authorize @user_city
  end

  private
  def user_city_params
    params.require(:user_city).permit(:name, :user_id)
  end

end
