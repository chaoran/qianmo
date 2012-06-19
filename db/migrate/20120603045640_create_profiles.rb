class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.boolean :sex
      t.date :date_of_birth
      t.string :hometown
      t.string :current_city
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
