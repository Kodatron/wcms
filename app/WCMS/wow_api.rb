class WowApi

  def initialize(region = 'eu', locale = "en_GB")
    RBattlenet.authenticate(api_key: ENV['BLIZZ_KEY'])
    RBattlenet.set_region(region: region, locale: locale)
  end

  def get_character_avatar(server, name, *args)
    thumbnail = RBattlenet::Wow::Character.find(name: name, realm: server)
    thumbnail['thumbnail']
  end

  def get_character_data(server, name, fields, *args)
    RBattlenet::Wow::Character.find(name: @user.name, realm: @user.profile.wow_server, fields: fields)
  end

  def get_wow_item(id, *args)
    RBattlenet::Wow::Item.find(id: id);
  end

  def get_item_set_bonus(id, *args)
    RBattlenet::Wow::Item.find_set(id: id)
  end

  def get_simple_guild_profile(server, name, *args)
    RBattlenet::Wow::Guild.find(name: name, realm: server)
  end

  def get_advanced_guild_profile(server, name, fields, *args)
    RBattlenet::Wow::Guild.find(name: name, realm: server, fields: fields)
  end

  def get_pvp_leaderboards(bracket, *args)
    RBattlenet::Wow::Pvp.find_bracket(bracket: bracket)
  end

  def get_quest(id, *args)
    RBattlenet::Wow::Quest.find(id: id)
  end

  def get_realm_status(*args)
    RBattlenet::Wow::Realm.find
  end

  def get_recipe(id, *args)
    RBattlenet::Wow::Recipe.find(id: id)
  end

  def get_spell(id, *args)
    RBattlenet::Wow::Spell.find(id: id)
  end

  def get_challenge_realm_leaderboard(server, *args)
    RBattlenet::Wow::Challenge.find_realm(realm: server)
  end

  def get_challene_region_leaderboard(*args)
    RBattlenet::Wow::Challenge.find_region
  end

  def get_realms(region, *args)
    RBattlenet::Wow::Realm.status
  end
end
