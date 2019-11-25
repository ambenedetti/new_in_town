class AddUpvoteCountToTips < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :upvote_count, :integer, default: 0
  end
end
