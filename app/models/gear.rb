class Gear < ActiveRecord::Base
  belongs_to :user
  has_one :enchant
  has_one :set_piece
  has_many :wow_gems

  enum item: [:head, :neck, :shoulder, :back, :chest, :shirt, :tabard, :wrist, :feet, :hands, :waist, :legs, :finger1, :finger2, :trinket1, :trinket2, :mainHand, :offHand]
  enum quality: [:poor, :common, :uncommon, :rare, :epic, :legendary, :artifact, :hierloom]

  scope :active, -> {where(active: true)}

  def has_gems?
    self.wow_gems ? false : true
  end

  def is_enchanted?
    self.enchant ? true : false
  end

  def is_set_piece?
    self.set_piece ? true : false
  end

  def get_set_pieces
    self.set_piece.wow_id
  end
end
