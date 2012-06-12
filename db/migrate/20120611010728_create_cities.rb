class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :town
      t.string :admin
      t.string :country

      t.timestamps
    end
  end
end
