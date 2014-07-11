class Book < ActiveRecord::Base
  belongs_to :book_category

  extend FriendlyId
  friendly_id :title, use: :slugged
end
