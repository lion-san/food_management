class CreateItemLocations < ActiveRecord::Migration
  def change
    create_table :item_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
