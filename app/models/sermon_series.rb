class SermonSeries < ActiveRecord::Base
  attr_accessible :banner_image, :button_image, :current_series, :description, :end_date, :start_date, :title
end
