class SermonSeries < ActiveRecord::Base
  has_many :sermons

  attr_accessible :banner_image, :button_image, :current_series, :description, :end_date, :start_date, :title
  mount_uploader :banner_image, SermonImageUploader
  mount_uploader :button_image, SermonImageUploader
end
