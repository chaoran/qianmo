class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :page
      t.references :updater, :polymorphic => true

      t.timestamps
    end
    add_index :updates, :page_id
    add_index :updates, :updater_id
  end
end
