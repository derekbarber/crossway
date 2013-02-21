class Article < ActiveRecord::Base
  attr_accessible :author, :content, :published_at, :title, :image, :status
  
  mount_uploader :image, ArticleImageUploader
end
