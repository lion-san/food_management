namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_items
    make_categories
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


def make_categories
	Category.create!(name:"魚介類")
	Category.create!(name:"肉類")
	Category.create!(name:"米、穀類、シリアル")
	Category.create!(name:"野菜、果物")
	Category.create!(name:"飲料")
	Category.create!(name:"健康食品")
	Category.create!(name:"ダイエット食品")
	Category.create!(name:"加工食品")
	Category.create!(name:"菓子、デザート")
	Category.create!(name:"パスタ、麺類")
	Category.create!(name:"パン")
	Category.create!(name:"卵、乳製品")
	Category.create!(name:"調味料、スパイス")
	Category.create!(name:"詰め合わせ")
	Category.create!(name:"ミルク、ベビーフード")
	Category.create!(name:"非常食")
	Category.create!(name:"料理本")
	Category.create!(name:"その他")
end


def make_users
  99.times do |n|
    name   = Faker::Name.name
    email   = "example-#{n+1}@nofoodloss.jp"
    password = "password"
    User.create!(
                 name: name,
                 email: email,
                 password:0
      )
    make_user_util(n)
  end
end

def make_user_util(i)
    UserUtil.create!(
                 point: 500,
                 user_id: i,
                 reset:0
      )
end
