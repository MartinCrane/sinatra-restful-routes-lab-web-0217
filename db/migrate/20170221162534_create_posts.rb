class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |s|
      s.string :name
      s.string :content
    end
  end

  def down
    drop_table :posts
  end
end
