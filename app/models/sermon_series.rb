class SermonSeries < ActiveRecord::Base
  has_many :sermons

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :banner_image, SermonImageUploader
  mount_uploader :button_image, SermonImageUploader
end
