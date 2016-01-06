namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_users
    #make_items
    make_categories
    make_item_statuses
    #make_exchange_methods
  end
end


def make_items
  99.times do |n|
    name   = Faker::App.name
    detail = Faker::Hacker.say_something_smart
    price = 100
    now_datetime = DateTime.now
    
    Item.create!(
                 user_id: 1,
                 name: name,
                 like: 77,
                 price: price,
                 item_detail: detail,
                 category_id: 1,
                 item_status_id: 1,
                 exchange_method_id: 1,
                 exchange_date: now_datetime,
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
	Category.create!(name:"パン")
	Category.create!(name:"魚、魚介類")
	Category.create!(name:"果物")
	Category.create!(name:"インスタント食品")
	Category.create!(name:"調味料ほか")
	Category.create!(name:"肉")
	Category.create!(name:"野菜")
	Category.create!(name:"飲料類")
end

def make_item_statuses
	ItemStatus.create!(name:"【未使用】")
	ItemStatus.create!(name:"残り【3/4】")
	ItemStatus.create!(name:"残り【1/2】")
	ItemStatus.create!(name:"残り【1/4】")
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
