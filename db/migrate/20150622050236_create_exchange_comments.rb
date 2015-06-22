class CreateExchangeComments < ActiveRecord::Migration
  def change
    create_table :exchange_comments do |t|
      t.integer :exchange_id
      t.integer :user_id
      t.string :comment
      t.integer :delete

      t.timestamps
    end
  end
end
