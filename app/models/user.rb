class User < ApplicationRecord
  validates_presence_of :password
  validates :email, :username, uniqueness: true, presence: true

  has_many :athletes

  has_secure_password
end
