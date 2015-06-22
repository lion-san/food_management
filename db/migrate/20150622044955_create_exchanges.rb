class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :item_id
      t.integer :buyer_id
      t.integer :status
      t.integer :appraisal
      t.string :comment

      t.timestamps
    end
  end
end
