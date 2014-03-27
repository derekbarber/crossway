class AddSlugToSermonSeries < ActiveRecord::Migration
  def change
    add_column :sermon_series, :slug, :string
    add_index :sermon_series, :slug
  end
end
