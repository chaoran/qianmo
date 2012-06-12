class RemoveRealNameFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :real_name
      end

  def down
    add_column :profiles, :real_name, :string
  end
end
