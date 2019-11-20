class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :direction
      t.references :tip, foreign_key: true
      t.integer :user_id
      t.string :guest

      t.timestamps
    end
  end
end
