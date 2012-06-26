class AddHasPostsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :has_posts, :boolean
  end
end
