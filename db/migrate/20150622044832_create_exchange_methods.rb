class CreateExchangeMethods < ActiveRecord::Migration
  def change
    create_table :exchange_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
