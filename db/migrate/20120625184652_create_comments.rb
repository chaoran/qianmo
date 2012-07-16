class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.text :text
      t.references :user
      t.integer :likes_count, :default => 0
      
      t.timestamps
    end
    add_index :comments, :commentable_id
    add_index :comments, :user_id
  end
end
