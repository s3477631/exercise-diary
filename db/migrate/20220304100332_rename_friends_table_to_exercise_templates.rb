class RenameFriendsTableToExerciseTemplates < ActiveRecord::Migration[7.0]
  def change
    rename_table :friends, :exercise_templates
  end
end
