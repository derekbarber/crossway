class AddAudioFileDurationToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :audio_file_duration, :string
  end
end
