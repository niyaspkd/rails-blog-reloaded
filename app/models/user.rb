class User < ActiveRecord::Base
  has_secure_password
  validates :email , uniqueness: true
# validates :password, presence: true, length: { minimum: 6 }
#  validates :password_confirmation, presence: true
  end
