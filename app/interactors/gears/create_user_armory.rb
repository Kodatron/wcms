module Gears
  class CreateUserArmory
    include Interactor
    include GearHelper

    def call
      context[:armory_data].each do |items|
        items.each do |item, data|
          gear = Gear.new(
            user_id: context[:user].id,
            item_id: data['id'],
            name: data['name'],
            ilvl: calculate_ilvl(data),
            thumbnail: data['icon'],
            quality: data['quality'],
            item: item,
            active: 1,
            content: data['context'],
            item_upgrades: data['tooltipParams']['upgrade'] ? data['tooltipParams']['upgrade']['current'] : 0,
            bonus: data['bonusLists'].join(":")
          )
          gear.save!

          if data['tooltipParams']['enchant']
            enchant = Enchant.new(gear_id: gear.id, wow_id: data['tooltipParams']['enchant'])
            enchant.save!
          end
          if data['tooltipParams']['gem0']
            gems = []
            (0..3).each do |i|
              if data['tooltipParams']["gem#{i}"]
                gems << data['tooltipParams']["gem#{i}"]
              end
            end
            wow_gem = WowGem.new(gear_id: gear.id, wow_id: gems.join(":"))
            wow_gem.save!
          end
          if data['tooltipParams']['set']
            set_piece = SetPiece.new(gear_id: gear.id, wow_id: data['tooltipParams']['set'].join(":"))
            set_piece.save!
          end
        end
      end

      armory_update = ArmoryUpdate.new(user_id: context[:user].id)
      armory_update.save!

    end
  end
end
