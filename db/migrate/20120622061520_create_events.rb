class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :receiver, :polymorphic => true
      t.references :trigger, :polymorphic => true

      t.timestamps
    end
    add_index :events, :receiver_id
    add_index :events, :trigger_id
  end
end
