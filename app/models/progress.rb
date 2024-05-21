class Progress < ApplicationRecord
  validates_presence_of :weight, :reps
  validates_numericality_of :weight, :reps
  
  belongs_to :athlete
  has_many :progress_movements, dependent: :destroy
  has_many :movements, through: :progress_movements
end
