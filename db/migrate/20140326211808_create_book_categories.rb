class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
