class BookCategory < ActiveRecord::Base
  has_many :books

  extend FriendlyId
  friendly_id :title, use: :slugged
end
