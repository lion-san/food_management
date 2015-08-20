class AddContenttypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :picture1_content_type, :string
    add_column :items, :picture2_content_type, :string
    add_column :items, :picture3_content_type, :string
    add_column :items, :picture4_content_type, :string
    add_column :items, :thumbnail_content_type, :string
  end
end
