class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :user_item_id
      t.string :memo
      t.integer :price
      t.integer :delete_status, default:0

      t.timestamps
    end
  end
end
