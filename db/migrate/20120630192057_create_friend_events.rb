class CreateFriendEvents < ActiveRecord::Migration
  def change
    create_table :friend_events do |t|
      t.references :trigger
      t.references :receiver
      t.string :event_type
      t.boolean :consumed, :default => false

      t.timestamps
    end
    add_index :friend_events, :trigger_id
    add_index :friend_events, :receiver_id
  end
end
