class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :user_item_id
      t.integer :item_status_id
      t.integer :item_location_id
      t.integer :price
      t.datetime :purchase_date
      t.datetime :best_before_date
      t.integer :delete_status
      t.integer :alert_id
      t.integer :alert_is_read

      t.timestamps
    end
  end
end
