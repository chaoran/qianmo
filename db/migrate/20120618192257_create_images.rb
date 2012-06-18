class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :page
      t.string :img

      t.timestamps
    end
    add_index :images, :page_id
  end
end
