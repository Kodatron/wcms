class Gear < ActiveRecord::Base
  include WcmsModules::Tooltip
  belongs_to :character
  has_one :enchant
  has_one :set_piece
  has_one :wow_gem

  enum item: [:head, :neck, :shoulder, :back, :chest, :shirt, :tabard, :wrist, :feet, :hands, :waist, :legs, :finger1, :finger2, :trinket1, :trinket2, :mainHand, :offHand]
  enum quality: [:poor, :common, :uncommon, :rare, :epic, :legendary, :artifact, :heirloom]

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
    self.bonus.blank? ? false : true
  end

  def get_bonus
    self.bonus
  end

  def get_set_pieces
    self.set_piece.wow_id
  end

  def get_gems
    self.wow_gem.wow_id
  end

  def gear_enchant
    self.enchant.wow_id
  end
end
