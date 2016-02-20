class Profile < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true

  enum wow_region: [:eu, :us, :tw, :kr, :sea]
  enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
             :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  belongs_to :user
end
