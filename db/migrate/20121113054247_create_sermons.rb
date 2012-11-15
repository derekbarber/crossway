class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.integer :sermon_series_id
      t.date :date
      t.string :scripture_reference
      t.text :description
      t.string :speaker
      t.text :audio_file
      t.text :video_embed

      t.timestamps
    end
  end
end
