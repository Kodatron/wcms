module Gears
  class GetArmoryData
    include Interactor

    def call
      context[:armory_data] = []
      user = context[:user]
      profile = user.profile
      # Get character items
      items = context[:api].get_character_data(profile.wow_server, user.name)
      # Clean up the data and put into a hash
      # Delete data we wont need
      items['items'].delete('averageItemLevel')
      items['items'].delete('averageItemLevelEquipped')
      context[:armory_data] << items['items']
    end
  end
end
