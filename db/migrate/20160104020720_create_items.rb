class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :store_id
      t.integer :category_id
      t.string :item_detail
      t.blob :thumbnail
      t.string :thumbnail_content_type
      t.datetime :standard_best_before_date

      t.timestamps
    end
  end
end
