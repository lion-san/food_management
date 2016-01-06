class AddUseThumbnailToUserItem < ActiveRecord::Migration
  def change
    add_column :user_items, :use_thumbnail, :boolean, :default=>false
  end
end
