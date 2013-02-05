class AddDisplayOrderToPeople < ActiveRecord::Migration
  def change
    add_column :people, :display_order, :integer
  end
end
