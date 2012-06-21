class CreateWhiteboards < ActiveRecord::Migration
  def change
    create_table :whiteboards do |t|
      t.references :page
      t.string :title
      t.text :text

      t.timestamps
    end
    add_index :whiteboards, :page_id
  end
end
