module WcmsModules::Tooltip
  def build_link
    base = ""
    base << "item=#{self.item_id}&amp;upgd=#{self.item_upgrades}"
    if self.has_bonus?
      base << "&amp;bonus=#{self.get_bonus}"
    end
    if self.is_enchanted?
      base << "&amp;ench=#{self.gear_enchant}"
    end
    if self.has_gem?
      base << "&amp;gems=#{self.get_gems}"
    end
    if self.is_set_piece?
      base << "&amp;pcs=#{self.get_set_pieces}"
    end
    if self.hierloom?
      base << "&amp;lvl=100"
    end
    base
  end
end
