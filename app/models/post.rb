class Post < ActiveRecord::Base
  enum status: [:draft, :published]

  #scopes
  scope :by_date, -> {
    where("published_at <= ?", Date.current).order("published_at DESC")
  }

  scope :search, -> (term) {
    where("title LIKE ?", *(["%#{term}%"]*1))
  }
end
