class AddTitleToMovies < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.string :title
    end
  end
end
