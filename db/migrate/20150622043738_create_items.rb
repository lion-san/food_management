class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.integer :like
      t.integer :price
      t.binary :thumbnail, limit: 1.megabyte
      t.binary :picture1, limit: 5.megabyte
      t.binary :picture2, limit: 5.megabyte
      t.binary :picture3, limit: 5.megabyte
      t.binary :picture4, limit: 5.megabyte
      t.string :item_detail
      t.integer :category_id
      t.integer :status_id
      t.integer :exchange_method_id
      t.datetime :exchange_date
      t.integer :delete

      t.timestamps
    end
  end
end
