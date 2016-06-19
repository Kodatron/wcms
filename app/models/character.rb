class Character < ActiveRecord::Base
  include WcmsModules::WowServerAndRegion
  belongs_to :user
  has_many :gears, dependent: :destroy

  scope :main, -> { where(state: 0).first }
  scope :alts, -> { where(state: 1) }

  def current_gear
    self.gears.where(active: true)
  end
end
