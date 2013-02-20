class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image, :string
    add_column :articles, :status, :integer
  end
end
