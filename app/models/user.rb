class User < ApplicationRecord
	has_secure_password
  	validates :first_name, :name, :email, presence: true
	validates :email, uniqueness: true
end
