class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :gallery
      t.string :description
      t.string :image

      t.timestamps
    end
    add_index :pictures, :gallery_id
  end
end
