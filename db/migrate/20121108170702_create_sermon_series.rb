class CreateSermonSeries < ActiveRecord::Migration
  def change
    create_table :sermon_series do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :banner_image
      t.string :button_image
      t.boolean :current_series

      t.timestamps
    end
  end
end
