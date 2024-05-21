class Goal < ApplicationRecord
  validates_presence_of :target_weight, :target_reps
  validates_numericality_of :target_weight, :target_reps

  belongs_to :athlete
  belongs_to :movement
end
