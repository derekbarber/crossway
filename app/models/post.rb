class Post < ActiveRecord::Base
  attr_accessible :author, :content, :post_date, :title
  
  validates_presence_of :title, :author, :post_date, :content
  validates_uniqueness_of :title
  
end
