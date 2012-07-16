class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.references :post
      t.references :page

      t.timestamps
    end
    add_index :abouts, :post_id
    add_index :abouts, :page_id
  end
end
