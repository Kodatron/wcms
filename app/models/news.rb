class News < ActiveRecord::Base
  enum status: [:draft, :published]
  # TODO: More permissions will be added later
  enum permissions: [:member, :everyone]

  validates :title, presence: true
  validates :body, presence: true

  scope :search, -> (term) {
    where("title LIKE ?", *(["%#{term}%"]*1))
  }
end
