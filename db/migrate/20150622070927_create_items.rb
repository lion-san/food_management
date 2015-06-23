class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.integer :like
      t.integer :price
      t.binary :thumbnail
      t.binary :picture1
      t.binary :picture2
      t.binary :picture3
      t.binary :picture4
      t.string :item_detail
      t.integer :category_id
      t.integer :item_status_id
      t.integer :exchange_method_id
      t.datetime :exchange_date
      t.integer :del

      t.timestamps
    end
  end
end
