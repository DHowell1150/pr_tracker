class Athlete < ApplicationRecord
  validates_presence_of :name, :gender, :birthday
  validates_numericality_of :height, :weight
  

  belongs_to :user
  has_many :movements, dependent: :destroy
  has_many :movement_goals, through: :movements
  has_many :goals, dependent: :destroy
  has_many :progresses, dependent: :destroy
end