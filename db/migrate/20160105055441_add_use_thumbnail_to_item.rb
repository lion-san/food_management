class AddUseThumbnailToItem < ActiveRecord::Migration
  def change
    add_column :items, :use_thumbnail, :boolean, :default => false
  end
end
