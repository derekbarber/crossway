class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  #attr_accessible :author, :content, :published_at, :title, :image, :status
  
  mount_uploader :image, ArticleImageUploader
  
  paginates_per 5
end
