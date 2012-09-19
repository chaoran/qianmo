class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :page
      t.string :title
      t.string :alt_title
      t.string :subtitle
      t.string :author
      t.string :cover
      t.string :translator
      t.string :publisher
      t.string :pages
      t.string :binding
      t.string :isbn
      t.string :genre
      t.string :country
      t.date :released_on
      t.text :summary
      t.timestamps
    end
    add_index :books, :page_id
  end
end
