class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }
  has_secure_password

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  scope :search, -> (term) {
    joins("INNER JOIN profiles p on user_id = p.user_id").
    where("users.name LIKE ? or users.email LIKE ? or p.firstname LIKE ? or p.lastname LIKE ? or p.wow_region LIKE ? or p.wow_server or p.phone LIKE ?", *(["%#{term}%"]*6))
  }
end
