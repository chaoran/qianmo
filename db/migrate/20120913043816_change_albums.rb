class ChangeAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.string :edition
      t.string :studio
      t.string :tracks
      t.string :country
    end
  end
end
