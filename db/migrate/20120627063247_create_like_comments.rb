class CreateLikeComments < ActiveRecord::Migration
  def change
    create_table :like_comments do |t|
      t.references :user
      t.references :comment

      t.timestamps
    end
    add_index :like_comments, :user_id
    add_index :like_comments, :comment_id
  end
end
