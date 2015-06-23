class Item < ActiveRecord::Base
  has_many :item_comments
  belongs_to :category
  belongs_to :item_status
  belongs_to :exchange_method
end
