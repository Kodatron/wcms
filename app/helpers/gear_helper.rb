module GearHelper
  def calculate_ilvl data
    if data['tooltipParams']['upgrade']
      return data['itemLevel'] + data['tooltipParams']['upgrade']['itemLevelIncrement']
    else
      return data['itemLevel']
    end
  end
end
