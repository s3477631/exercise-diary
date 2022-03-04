class ChangeExerciseTemplateColumns < ActiveRecord::Migration[7.0]
  def add
    remove_column :exercise_templates, :first_name
    remove_column :exercise_templates, :last_name
    remove_column :exercise_templates, :email
    remove_column :exercise_templates, :phone
    remove_column :exercise_templates, :instagram
  end
  def down
    add_column :exercise_templates, :exercise_name, :string
    add_column :exercise_templates, :weight, :float
    add_column :exercise_templates, :reps, :integer
    add_column :exercise_templates, :sets, :integer

  end
end
