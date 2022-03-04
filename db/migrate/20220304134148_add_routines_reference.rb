class AddRoutinesReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :routines, :exercise_template, index: true
  end
end
