namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_items
  end
end


def make_items
  99.times do |n|
    name   = Faker::App.name
    detail = Faker::Hacker.say_something_smart
    price = 100
    Item.create!(
                 user_id: 1,
                 name: name,
                 like: 77,
                 price: price,
                 item_detail: detail,
                 category_id: 1,
                 status_id: 1,
                 exchange_method_id: 1,
                 del:0
      )
    make_item_comments(n)
  end
end


def make_item_comments(i)
  3.times do |n|
    comment = Faker::Lorem.sentence(5)
    ItemComment.create!(
                 item_id: i,
                 user_id: 1,
                 comment: comment,
                 del:0
      )
  end
end
