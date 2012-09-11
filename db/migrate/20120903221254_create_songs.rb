class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :page
      t.references :album
      t.string :name
      t.string :artist
      t.string :genre
      t.text :lyrics

      t.timestamps
    end
    add_index :songs, :page_id
    add_index :songs, :album_id
  end
end
