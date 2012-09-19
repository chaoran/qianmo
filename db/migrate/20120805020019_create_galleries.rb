class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.references :user
      t.references :page

      t.timestamps
    end
    add_index :galleries, :user_id
    add_index :galleries, :page_id
    add_index :galleries, [:title, :user_id]
    add_index :galleries, [:title, :page_id]
  end
end
