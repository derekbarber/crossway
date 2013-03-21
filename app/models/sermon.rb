class Sermon < ActiveRecord::Base
  belongs_to :sermon_series
  
  attr_accessible :audio_file, :date, :description, :scripture_reference, :sermon_series_id, :speaker, :title, :video_embed, :audio_file_duration
  mount_uploader :audio_file, SermonAudioUploader
end
