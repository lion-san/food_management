namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_items
    make_categories
    make_item_statuses
    make_exchange_methods
  end
end


def make_items
  99.times do |n|
    name   = Faker::App.name
    detail = Faker::Hacker.say_something_smart
    price = 100
    exchange_date = DateTime.now
    
    Item.create!(
                 user_id: 1,
                 name: name,
                 like: 77,
                 price: price,
                 item_detail: detail,
                 category_id: 1,
                 item_status_id: 1,
                 exchange_method_id: 1,
                 exchange_date: exchange_date,
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

def make_item_statuses
	ItemStatus.create!(name:"新品、未使用")
	ItemStatus.create!(name:"未使用に近い")
	ItemStatus.create!(name:"目立った傷や汚れなし")
	ItemStatus.create!(name:"やや傷や汚れあり")
	ItemStatus.create!(name:"傷や汚れあり")
	ItemStatus.create!(name:"全体的に状態が悪い")
end

def make_exchange_methods
	ExchangeMethod.create!(name:"市役所")
	ExchangeMethod.create!(name:"公民館")
	ExchangeMethod.create!(name:"nanoda")
	ExchangeMethod.create!(name:"手渡し")
	ExchangeMethod.create!(name:"郵送（元払い）")
	ExchangeMethod.create!(name:"郵送（着払い）")
end

def make_users
  99.times do |n|
    name   = Faker::Name.name
    email   = "example-#{n+1}@nofoodloss.jp"
    password = "password"
    User.create!(
                 name: name,
                 email: email,
                 password: password,
                 password_confirmation: password
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
