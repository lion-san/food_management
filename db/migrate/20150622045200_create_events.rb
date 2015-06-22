class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :is_read
      t.integer :item_comment_id
      t.integer :exchange_comment_id
      t.integer :item_id

      t.timestamps
    end
  end
end
