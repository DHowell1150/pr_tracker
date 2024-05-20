class Movement < ApplicationRecord
  validates_presence_of :movement_name, :image, :video, :description
  
  belongs_to :athlete
  has_many :movement_goals, dependent: :destroy
  has_many :progress_movements, dependent: :destroy
end