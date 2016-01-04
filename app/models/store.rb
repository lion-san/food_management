class Store < ActiveRecord::Base
  has_many :items
  has_many :user_items
end
