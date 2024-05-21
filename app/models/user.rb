class User < ApplicationRecord
  validates :name, :password, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :athletes
end
