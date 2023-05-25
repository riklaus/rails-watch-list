class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been bookmarked in this list." }
  validates :comment, length: { minimum: 6 }, allow_blank: true
end
