class GuildApplication < ActiveRecord::Base
  before_save :downcase_server
  enum status: [:pending, :approved, :declined]
  enum wow_region: [:eu, :us, :tw, :kr, :sea]
  enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
             :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]

  def downcase_server
    self.wow_server = wow_server.downcase.sub!(' ', '-') if self.new_record?
  end
end
