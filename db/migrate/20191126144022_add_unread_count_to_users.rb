class AddUnreadCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unread_count, :integer, default: 0
  end
end
