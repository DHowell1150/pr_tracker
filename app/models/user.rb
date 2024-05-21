class User < ApplicationRecord

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password    # What's the difference? :   validates :email, presence: true
  validates_presence_of :password
# Do I need these? 
  # validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :email, confirmation: { case_sensitive: false }

  has_many :athletes
end

