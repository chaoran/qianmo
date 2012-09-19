class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :page
      t.string :title
      t.string :image
      t.string :directed_by
      t.string :written_by
      t.string :starring
      t.string :genre
      t.string :studio
      t.string :country
      t.string :also_known_as
      t.date :released_on
      t.text :storyline

      t.timestamps
    end
    add_index :movies, :page_id
  end
end
