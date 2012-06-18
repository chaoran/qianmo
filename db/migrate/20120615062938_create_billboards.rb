class CreateBillboards < ActiveRecord::Migration
  def change
    create_table :billboards do |t|
      t.string :header
      t.text :content
      t.string :button_name
      t.string :button_value
      t.references :page
      t.timestamps
    end
  end
end
