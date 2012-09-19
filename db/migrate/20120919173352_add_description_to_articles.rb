class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.string :description
    end
  end
end
