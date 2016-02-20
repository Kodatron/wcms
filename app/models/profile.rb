class Profile < ActiveRecord::Base
  after_create :init_character_avatar
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :wow_region, presence: true
  validates :wow_server, presence: true

  enum wow_region: [:eu, :us, :tw, :kr, :sea]
  enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
             :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  belongs_to :user

  def init_character_avatar
    RBattlenet.authenticate(api_key: ENV['BLIZZ_KEY'])
    RBattlenet.set_region(region: "eu", locale: "en_GB")
    if character = RBattlenet::Wow::Character.find(name: self.user.name, realm: self.wow_server)
      self.avatar = character['thumbnail']
      self.save!
    end
  end
end
