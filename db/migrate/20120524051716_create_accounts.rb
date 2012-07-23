class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.datetime :remembered_at
      t.datetime :confirmed_at
      t.datetime :password_set_at
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end
    
    add_index :accounts, :email, :unique => true
    add_index :accounts, :username, :unique => true
    add_index :accounts, :password_reset_token, :unique => true
  end
end

