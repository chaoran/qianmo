class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.references :page
      t.string :label
      t.string :value

      t.timestamps
    end
    add_index :attributes, :page_id
  end
end
