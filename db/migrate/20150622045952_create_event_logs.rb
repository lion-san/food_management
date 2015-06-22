class CreateEventLogs < ActiveRecord::Migration
  def change
    create_table :event_logs do |t|
      t.integer :user_id
      t.string :event_type
      t.string :data

      t.timestamps
    end
  end
end
