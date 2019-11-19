class RemoveCitiesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cities, :text
  end
end
