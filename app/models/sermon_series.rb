class SermonSeries < ActiveRecord::Base
  attr_accessible :banner_image, :button_image, :current_series, :description, :end_date, :start_date, :title
  mount_uploader :banner_image, BannerImageUploader
  #mount_uploader :button_image, ImageUploader
end
