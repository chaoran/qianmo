class CreatePageFollows < ActiveRecord::Migration
  def change
    create_table :page_follows do |t|
      t.references :page
      t.references :user

      t.timestamps
    end
    add_index :page_follows, :page_id
    add_index :page_follows, :user_id
  end
end
