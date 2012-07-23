class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.string :unconfirmed_email
      t.string :confirmation_token
      t.datetime :confirmation_sent_at
      t.references :account

      t.timestamps
    end
    add_index :confirmations, :account_id, :unique => true
    add_index :confirmations, :confirmation_token, :unique => true
  end
end
