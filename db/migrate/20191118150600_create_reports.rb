class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :tip, foreign_key: true
      t.references :user, foreign_key: true
      t.string :description
      t.references :reason, foreign_key: true

      t.timestamps
    end
  end
end
