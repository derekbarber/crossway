class Sermon < ActiveRecord::Base
  belongs_to :sermon_series

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :audio_file, SermonAudioUploader
  
  def full_title
    scripture_reference.blank? ? "#{title}" : "#{title} (#{scripture_reference})"
  end
end
