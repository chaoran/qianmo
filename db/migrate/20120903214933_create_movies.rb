class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :page
      t.string :name
      t.string :image
      t.date :released_on
      t.string :directed_by
      t.string :written_by
      t.string :starring
      t.string :genre
      t.string :studio
      t.string :country
      t.string :also_known_as
      t.text :storyline

      t.timestamps
    end
    add_index :movies, :page_id
  end
end
