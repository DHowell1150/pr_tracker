class Athlete < ApplicationRecord
  validates_presence_of :name, :gender, :birthday, :height, :weight
  validates_numericality_of :height, :weight
  

  belongs_to :user
  has_many :movements, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :progresses, dependent: :destroy
  # has_many :movement_goals, through: :movements
  has_many :movement_goals, through: :goals
  has_many :progress_movements, through: :progresses

  #Steve's
  # belongs_to :user
  # has_many :progress_movements, dependent: :destroy
  # has_many :progresses, through: :progress_movements
  # has_many :movement_goals, dependent: :destroy
  # has_many :goals, through: :movement_goals
end