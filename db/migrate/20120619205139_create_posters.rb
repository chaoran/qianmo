class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.references :page
      t.string :background
      t.string :caption
      t.text :text
      t.string :link

      t.timestamps
    end
    add_index :posters, :page_id
  end
end
