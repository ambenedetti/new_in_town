class ChangeQuestionAssociation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tips, :question_id, true
  end
end
