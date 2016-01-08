namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_users
    #make_items
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
  Category.delete_all
	Category.create!(id:1, name:"パン")
	Category.create!(id:2, name:"魚介類")
	Category.create!(id:3, name:"果物")
	Category.create!(id:4, name:"インスタント食品")
	Category.create!(id:5, name:"調味料ほか")
	Category.create!(id:6, name:"肉類")
	Category.create!(id:7, name:"野菜")
	Category.create!(id:8, name:"飲料類")
  ######
	Category.create!(id:9, name:"卵、乳製品")
	Category.create!(id:10, name:"米、穀類、シリアル")
	Category.create!(id:11, name:"冷凍食品")
	Category.create!(id:12, name:"缶詰、瓶詰")
	Category.create!(id:13, name:"菓子、デザート")
	Category.create!(id:14, name:"パスタ、麺類")
	Category.create!(id:15, name:"非常食")
	Category.create!(id:16, name:"その他")
end

def make_item_statuses
  ItemStatus.delete_all
	ItemStatus.create!(id:1, name:"【未使用】")
	ItemStatus.create!(id:2, name:"残り【3/4】")
	ItemStatus.create!(id:3, name:"残り【1/2】")
	ItemStatus.create!(id:4, name:"残り【1/4】")
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
