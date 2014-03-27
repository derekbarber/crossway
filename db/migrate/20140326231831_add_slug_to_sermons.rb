class AddSlugToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :slug, :string
    add_index :sermons, :slug
  end
end
