class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :text
      t.references :entity, :polymorphic => true
      t.references :parent
      t.references :ancestor
      t.integer :reposts_count, :default => 0
      t.integer :likes_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    add_index :posts, [:entity_id, :entity_type]
    add_index :posts, :user_id
    add_index :posts, :parent_id
    add_index :posts, :ancestor_id
  end
end
