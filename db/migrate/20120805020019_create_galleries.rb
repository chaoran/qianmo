class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :user
      t.references :page
      t.string :title

      t.timestamps
    end
    add_index :galleries, :user_id
    add_index :galleries, :page_id
    add_index :galleries, [:title, :user_id]
  end
end
