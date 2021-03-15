class Book < ApplicationRecord
  validates :genre, presence: true
  validates :author, presence: true
  validates :image_url, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
  has_many  :rents
end
