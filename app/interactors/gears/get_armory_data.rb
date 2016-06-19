module Gears
  class GetArmoryData
    include Interactor

    def call
      context[:armory_data] = []
      character = context[:character]
      # Get character items
      items = context[:api].get_character_data(character.wow_server, character.name)
      # Clean up the data and put into a hash
      # Delete data we wont need
      items['items'].delete('averageItemLevel')
      items['items'].delete('averageItemLevelEquipped')
      context[:armory_data] << items['items']
    end
  end
end
