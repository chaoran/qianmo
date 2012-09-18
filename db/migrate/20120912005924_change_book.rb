class ChangeBook < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.string :pages
      t.string :binding
      t.string :isbn
      t.string :genre
      t.string :country
      t.text :summary
    end
  end
end
