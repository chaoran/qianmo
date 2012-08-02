class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.string :abouts
      t.string :mentions
      t.string :intro
      
      t.references :user
      
      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :title
  end
end
