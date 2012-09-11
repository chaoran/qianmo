class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :page
      t.string :name
      t.string :cover
      t.string :artist
      t.string :genre
      t.date :released_on
      t.text :introduction

      t.timestamps
    end
    add_index :albums, :page_id
  end
end
