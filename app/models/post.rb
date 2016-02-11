class Post < ActiveRecord::Base
  enum status: [:draft, :published]

  #scopes
  scope :by_date, -> {
    where("published_at <= ?", Date.current).order("published_at DESC")
  }
end
