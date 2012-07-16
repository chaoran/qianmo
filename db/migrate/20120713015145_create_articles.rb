class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.references :user
      t.references :page

      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :page_id
  end
end
