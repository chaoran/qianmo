class ChangeTracksInAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.remove :tracks
      t.text :tracks
    end
  end
end
