class ChangeColumnSubjectsProfessorToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column(:subjects, :professor_id, :user_id)
  end
end
