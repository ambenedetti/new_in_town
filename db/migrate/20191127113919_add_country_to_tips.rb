class AddCountryToTips < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :country, :string
  end
end
