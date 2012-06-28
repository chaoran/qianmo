class CreateLikePosts < ActiveRecord::Migration
  def change
    create_table :like_posts do |t|
      t.references :user
      t.references :post

      t.timestamps
    end
    add_index :like_posts, :user_id
    add_index :like_posts, :post_id
  end
end
