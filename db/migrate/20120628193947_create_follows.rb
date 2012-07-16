class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :user
      t.references :pair
      t.boolean :friend, :default => false
      t.boolean :special, :default => false
      t.boolean :read, :default => false

      t.timestamps
    end
    add_index :follows, :follower_id
    add_index :follows, :user_id
  end
end
