class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :comment
      t.integer :delete

      t.timestamps
    end
  end
end
