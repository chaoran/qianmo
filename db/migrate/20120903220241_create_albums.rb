class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :page
      t.string :title
      t.string :cover
      t.string :artist
      t.string :edition
      t.string :genre
      t.string :studio
      t.string :country
      t.date :released_on
      t.text :tracks
      t.text :introduction

      t.timestamps
    end
    add_index :albums, :page_id
  end
end
