class AddAltTitleToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.string :alt_title
    end
    
  end
end
