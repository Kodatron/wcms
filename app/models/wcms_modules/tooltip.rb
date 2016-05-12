module WcmsModules::Tooltip

  def build_link
    data = []

    data << [:item, self.item_id]
    data << [:upgr, self.item_upgrades]

    if self.has_bonus?
      data << [:bonus, self.get_bonus]
    end
    if self.is_enchanted?
      data << [:ench, self.gear_enchant]
    end
    if self.has_gem?
      data << [:gems, self.get_gems]
    end
    if self.is_set_piece?
      data << [:pcs, self.get_set_pieces]
    end
    if self.hierloom?
      data << [:lvl, 100]
    end

    link = []
    data.each do |key, value|
      link << ["#{key}=#{value}"]
    end

    link = link.join("&amp;")
    link
  end
end
