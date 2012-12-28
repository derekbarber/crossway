class RenameTypeFieldToRole < ActiveRecord::Migration
  def up
    rename_column :people, :type, :role
  end

  def down
    rename_column :people, :role, :type
  end
end
