class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :intro
      t.references :creator, :polymorphic => true
      t.boolean :editable
      t.boolean :has_billboard
      t.boolean :has_whiteboard
      t.boolean :has_posters
      t.boolean :has_image
      t.boolean :has_properties
      #t.boolean :picturable
      #t.boolean :commentable
      #t.boolean :discussable
      #t.boolean :ratable
      #t.boolean :chatable
      #t.boolean :checkinable
      t.string :image
      t.timestamps
    end
    add_index :pages, :creator_id
  end
end
