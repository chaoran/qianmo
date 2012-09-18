class ChangeNameToTitleInAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.remove :name
      t.string :title
    end
  end
end
