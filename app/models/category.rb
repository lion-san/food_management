class Category < ActiveRecord::Base
  has_many :user_items
end
