# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

CSV.foreach('db/okude.csv') do |row|

  # n:user_id
  n = 1
    a = UserItem.create(:user_id => n, :name => row[1], :category_id =>16 )
    Stock.create(:user_item_id =>a.id, :user_id => n, :purchase_date => row[0], :price => row[2],
               :item_status_id =>1 )
end
