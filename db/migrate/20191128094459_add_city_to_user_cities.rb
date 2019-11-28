class AddCityToUserCities < ActiveRecord::Migration[5.2]
  def change
    add_column :user_cities, :city, :string
    add_column :user_cities, :country, :string
    add_column :user_cities, :latitude, :float
    add_column :user_cities, :longitude, :float
  end
end
