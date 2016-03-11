module WcmsModules::WowServerAndRegion
  def self.included(base)
    base.validates :wow_region, :wow_server, presence: true

    base.enum wow_region: [:eu, :us, :tw, :kr]
    base.enum wow_class: [:death_knight, :druid, :hunter, :warlock, :mage,
               :paladin, :shaman, :warrior, :priest, :monk, :rogue, :demon_hunter]
   end
end
