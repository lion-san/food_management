class Item < ActiveRecord::Base
  has_many:stocks
  belongs_to:category
  belongs_to:store
end
