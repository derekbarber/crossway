class SermonSeries < ActiveRecord::Base
  has_many :sermons

  attr_accessible :banner_image, :button_image, :current_series, :description, :end_date, :start_date, :title, :banner_image_url, :button_image_url
  mount_uploader :banner_image, SermonImageUploader
  mount_uploader :button_image, SermonImageUploader
end
