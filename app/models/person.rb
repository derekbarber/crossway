class Person < ActiveRecord::Base
  attr_accessible :content, :image, :name, :title, :role, :enabled

  mount_uploader :image, PersonImageUploader
end
