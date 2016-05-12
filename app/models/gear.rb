class Gear < ActiveRecord::Base
  include WcmsModules::Tooltip
  belongs_to :user
  has_one :enchant
  has_one :set_piece
  has_one :wow_gem

  enum item: [:head, :neck, :shoulder, :back, :chest, :shirt, :tabard, :wrist, :feet, :hands, :waist, :legs, :finger1, :finger2, :trinket1, :trinket2, :mainHand, :offHand]
  enum quality: [:poor, :common, :uncommon, :rare, :epic, :legendary, :artifact, :hierloom]

  scope :active, -> {where(active: true)}

  def has_gem?
    self.wow_gem ? true : false
  end

  def is_enchanted?
    self.enchant ? true : false
  end

  def is_set_piece?
    self.set_piece ? true : false
  end

  def has_bonus?
    self.bonus == "[]" ? false : true
  end

  def has_bonus_stats?
    true
  end

  def get_bonus
    return 0 unless self.has_bonus?
    ids = []
    bonuses = self.bonus.split.to_a
    bonuses.each do |bonus|
      ids << bonus.to_i
    end
    ids.join(":")
  end

  def get_set_pieces
    ids = []
    set_pieces = self.set_piece.wow_id.split.to_a
    set_pieces.each do |pi|
      ids << pi.to_i
    end
    ids.join(":")
  end

  def get_gems
    ids = []
    gems = self.wow_gem.wow_id.split.to_a
    gems.each do |pi|
      ids << pi.to_i
    end
    ids.join(":")
  end

  def gear_enchant
    self.enchant.wow_id
  end
end
