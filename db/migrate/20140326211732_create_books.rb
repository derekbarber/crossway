class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :image
      t.integer :book_category_id
      t.string :url

      t.timestamps
    end
  end
end
