class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :cell_phone
      t.string :username
      t.string :hashed_password, :null => false

      t.timestamps
    end
  end
end
