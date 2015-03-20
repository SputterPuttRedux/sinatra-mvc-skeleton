class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  # Remember to create a migration!
end
