class UserItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :store
  belongs_to :user
  has_many   :stocks
  accepts_nested_attributes_for :stocks

  validates :name, presence: true
  validates :category_id, presence: true
end
