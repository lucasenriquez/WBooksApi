class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :author, presence: true
  validates :title, presence: true
  validates :link, presence: true
end
