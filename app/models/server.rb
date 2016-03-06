class Server < ActiveRecord::Base
  enum wow_region: [:eu, :us, :tw, :kr]
end
