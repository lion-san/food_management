class Item < ActiveRecord::Base
  has_many :item_comments
  belongs_to :category
end
