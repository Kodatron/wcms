class AltRequest < ActiveRecord::Base
  validates :reason, presence: true
  belongs_to :user
  belongs_to :alt

  enum status: [:pending, :approved, :declined]
end
