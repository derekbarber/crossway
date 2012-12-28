class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :image
      t.text :content
      t.integer :type
      t.boolean :enabled

      t.timestamps
    end
  end
end
