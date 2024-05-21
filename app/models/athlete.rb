class Athlete < ApplicationRecord
  validates_presence_of :name, :gender, :birthday, :height, :weight
  validates_numericality_of :height, :weight

  belongs_to :user
  has_many :movements, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :progress_movements, dependent: :destroy
  has_many :progresses, through: :progress_movements
end
