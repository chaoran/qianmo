class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :from
      t.string :title
      t.text :body
      t.boolean :read
      t.boolean :flaged

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :from_id
  end
end
