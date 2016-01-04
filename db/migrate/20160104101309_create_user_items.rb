class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.integer :user_id
      t.string :name
      t.integer :category_id
      t.string :item_detail
      t.binary :thumbnail
      t.string :thumbnail_content_type
      t.datetime :standard_best_before_date
      t.integer :store_id

      t.timestamps
    end
  end
end
