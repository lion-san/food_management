class Stock < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :user_item
  belongs_to :item_status
  belongs_to :item_location
  belongs_to :alert
end
