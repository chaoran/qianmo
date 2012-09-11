class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :page
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :cover
      t.string :translator
      t.string :publisher
      t.date :released_on

      t.timestamps
    end
    add_index :books, :page_id
  end
end
