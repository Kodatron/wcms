class Alt < ActiveRecord::Base
  include WcmsModules::WowServerAndRegion
  validates :wow_class, presence: true
  validates :wow_name, presence: true
  validates :wow_spec, presence: true
  validate :server_and_name, on: :create
  validate :existing_avatar, on: :create

  belongs_to :user
  has_many :alt_requests

  def existing_avatar
    errors.add(:avatar, 'We could not find any avatar in blizzards database') if self.avatar.nil?
  end

  def server_and_name
    errors.add(:wow_name, 'Character with that name and server is already taken') if Alt.exists?(wow_name: self.wow_name, wow_server: self.wow_server)
  end
end
