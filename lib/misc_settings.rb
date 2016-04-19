module MiscSettings

  def self.supported_locales
    ['SV', 'EN']
  end

  # This function needs to be broken out to db-level if we want others to use the project.
  # Db table called guilds or smth (only allowing one record in it)
  def self.guild_info option = nil
    info = {
      :name     =>  "Family Legion",
      :faction  =>  "Alliance",
      :region   =>  "EU",
      :server    =>  "Grim Batol",
      :country  =>  "Sweden"
    }

    option.nil? ? info : info[option]
  end

  def self.copyright
    "Copyright © #{guild_info(:name)} #{site_years}. All rights reserved."
  end

  def self.version
    'v.0.1 Alpha'
  end

  def self.contact
    'bjorngrunde@live.se'
  end

  def self.developers
    ['Björn Grunde', 'Johannes Nyberg']
  end

  def self.site_years
    year = start_year
    current_year = Date.current.year
    current_year == year ? year : "#{year} - #{current_year}"
  end

  def self.start_year
    2016
  end
end
