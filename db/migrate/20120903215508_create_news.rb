class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :page
      t.string :title
      t.string :url
      t.text :summary

      t.timestamps
    end
    add_index :news, :page_id
  end
end
