class Stock < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :user_item
  belongs_to :category
  belongs_to :item_status
  belongs_to :item_location
  belongs_to :alert

  validates :item_status_id, presence: true
  validates :purchase_date, presence: true
end
