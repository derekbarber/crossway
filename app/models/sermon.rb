class Sermon < ActiveRecord::Base
  attr_accessible :audio_file, :date, :description, :scripture_reference, :sermon_series_id, :speaker, :title, :video_embed
end
