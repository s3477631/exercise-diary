class Routine < ApplicationRecord
    has_one :user, through: :exercise_templates
end
