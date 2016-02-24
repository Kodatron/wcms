class AltRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :alt

  enum status: [:pending, :approved, :declined]
end
