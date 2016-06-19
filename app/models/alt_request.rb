class AltRequest < ActiveRecord::Base
  validates :reason, presence: true
  belongs_to :user
  belongs_to :character

  enum status: [:pending, :approved, :declined]

  scope :settings, -> {
    order("status ASC, created_at DESC")
    .limit(10)
  }
end
