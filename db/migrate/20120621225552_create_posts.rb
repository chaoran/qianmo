class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :text
      t.references :parent
      t.integer :children_count, :default => 0
      t.integer :likes_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :parent_id
  end
end
