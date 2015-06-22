class CreateUserUtils < ActiveRecord::Migration
  def change
    create_table :user_utils do |t|
      t.integer :user_id
      t.integer :point
      t.integer :reset

      t.timestamps
    end
  end
end
