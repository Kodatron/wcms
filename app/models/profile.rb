class Profile < ActiveRecord::Base
  #before_save { self.wow_server = wow_server.downcase.sub! ' ', '-' }
  validates :firstname, presence: true
  validates :lastname, presence: true
  #validates :wow_region, presence: true
  #validates :wow_server, presence: true

  enum wow_region: [:eu, :us, :tw, :kr, :sea]
  enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
             :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  belongs_to :user
end
