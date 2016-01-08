class Wish < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_item
  belongs_to :item
end
