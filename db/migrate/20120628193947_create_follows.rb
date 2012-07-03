class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user
      t.references :follower

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :follower_id
  end
end
