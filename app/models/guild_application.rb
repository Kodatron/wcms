class GuildApplication < ActiveRecord::Base
  include WcmsModules::WowServerAndRegion
  enum status: [:pending, :approved, :declined]
end
