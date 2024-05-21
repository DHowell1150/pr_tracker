class Goal < ApplicationRecord
  validates_presence_of :weight, :reps
  validates_numericality_of :weight, :reps

  belongs_to :athlete
  has_many :movement_goals, dependent: :destroy
  has_many :movements, through: :movement_goals
end