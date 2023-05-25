class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :list, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
      errors.add(:base, 'Cannot delete the movie as it is referenced in at least one bookmark.')
      throw(:abort)
    end
  end
end
