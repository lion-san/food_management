class Item < ActiveRecord::Base
  has_many :item_comments
end
