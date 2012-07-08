class AddChildrenCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :children_count, :integer, :default => 0
    Post.reset_column_information
    Post.find(:all).each do |p|
      Post.update_counters p.id, :children_count => p.children.length
    end
  end

  def self.down
    remove_column :posts, :children_count
  end
end
