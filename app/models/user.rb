class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  has_many :lists
  has_many :items, through: :lists
end
