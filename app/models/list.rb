class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  # Remember to create a migration!

  def parse_items
    #called on an instance of list
    #will parse the string content and change them into
    #individual list items.

  end
end
