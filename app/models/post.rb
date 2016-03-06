class Post < ActiveRecord::Base
  enum status: [:draft, :published]
  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true

  belongs_to :user
  #scopes
  scope :by_date, -> {
    where("published_at <= ?", Date.current).order("published_at DESC")
  }

  scope :search, -> (term) {
    where("title LIKE ?", *(["%#{term}%"]*1))
  }
end
