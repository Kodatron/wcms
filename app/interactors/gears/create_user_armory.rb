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
            thumbnail: data['tooltipParams']['transmogItem'] ? context[:api].get_transmog_icon(data['tooltipParams']['transmogItem']) : data['icon'],
            quality: data['quality'],
            item: item,
            active: 1,
            enchanted: data['tooltipParams']['enchant'] ? true : false,
            gem: data['tooltipParams']['gem0'] ? true : false,
            transmogged: data['tooltipParams']['transmogItem'] ? true : false,
            content: data['context'],
            item_upgrades: data['tooltipParams']['upgrade'] ? data['tooltipParams']['upgrade']['current'] : 0,
            set: data['tooltipParams']['set'] ? true : false
          )
          gear.save!

          if gear.enchanted?
            enchant = Enchant.new(gear_id: gear.id, wow_id: data['tooltipParams']['enchant'])
            enchant.save!
          end
          if gear.gem?
            wow_gem = WowGem.new(gear_id: gear.id, wow_id: data['tooltipParams']['gem0'])
            wow_gem.save!
          end
          if gear.set?
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
