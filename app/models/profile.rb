class Profile < ActiveRecord::Base
  include WcmsModules::WowServerAndRegion
  validates :firstname, presence: true
  validates :lastname, presence: true
  belongs_to :user
end
