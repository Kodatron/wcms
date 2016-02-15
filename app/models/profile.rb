class Profile < ActiveRecord::Base
  before_save { self.server = server.downcase.sub! ' ', '-' }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :region, presence: true
  validates :server, presence: true

  enum region: [:eu, :us, :tw, :kr, :sea]
  enum class: [:death_knight, :druid, :hunter, :warlock, :mage,
              :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  belongs_to :user
end
