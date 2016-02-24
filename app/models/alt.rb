class Alt < ActiveRecord::Base
  validates :wow_region, presence: true
  validates :wow_server, presence: true
  validates :wow_class, presence: true
  validates :wow_name, presence: true
  validates :wow_spec, presence: true

  validate :server_and_name

  enum wow_region: [:eu, :us, :tw, :kr, :sea]
  enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
             :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  belongs_to :user

  def server_and_name
    errors.add(:wow_name, 'Character with that name and server is already taken') if Alt.exists?(wow_name: self.wow_name, wow_server: self.wow_server)
  end
end
