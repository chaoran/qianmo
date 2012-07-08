class CreateMentionEvents < ActiveRecord::Migration
  def change
    create_table :mention_events do |t|
      t.references :trigger, :polymorphic => true
      t.references :receiver
      t.boolean :consumed, :default => false

      t.timestamps
    end
    add_index :mention_events, :trigger_id
    add_index :mention_events, :receiver_id
  end
end
