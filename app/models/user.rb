class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  # validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :email, confirmation: { case_sensitive: false }
  validates :password, presence: true

  has_many :athletes
end