class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true  
  has_secure_password
  has_many :cryptocurrencies
end
