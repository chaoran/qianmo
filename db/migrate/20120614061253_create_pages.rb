class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :intro
      t.string :category
      t.references :user
      t.boolean :editable
      t.timestamps
    end
    add_index :pages, :user_id
    add_index :pages, :title
  end
end
