class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :page
      t.string :label
      t.string :value

      t.timestamps
    end
    add_index :properties, :page_id
  end
end
