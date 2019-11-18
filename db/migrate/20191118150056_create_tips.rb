class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.text :content
      t.string :city
      t.string :title
      t.float :latitude
      t.float :longitude
      t.references :category, foreign_key: true
      t.integer :status
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
