class Athlete < ApplicationRecord
  validates :name, :gender, :birthday, :feet, :inches, :weight, presence: true
  validates :feet, :inches, :weight, numericality: { only_integer: true }

  belongs_to :user
  has_many :movements, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :progress_movements, dependent: :destroy
  has_many :progresses, through: :progress_movements
end
