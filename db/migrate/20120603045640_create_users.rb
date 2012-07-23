class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :sex
      t.date :date_of_birth
      t.string :avatar
      t.datetime :last_seen_at
      t.string :status
      t.string :lives_in
      t.string :hometown
      t.references :account

      t.timestamps
    end
    
    add_index :users, :name,                 :unique => true
    add_index :users, :account_id,           :unique => true
  end
end
