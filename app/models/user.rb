class User < ActiveRecord::Base
  attr_accessor :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }, on: :create
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :alts, dependent: :destroy
  has_many :alt_requests, dependent: :destroy

  accepts_nested_attributes_for :profile

  scope :search, -> (term) {
    joins("INNER JOIN profiles p on user_id = p.user_id").
    where("users.name LIKE ? or users.email LIKE ? or p.firstname LIKE ? or p.lastname LIKE ? or p.wow_region LIKE ? or p.wow_server or p.phone LIKE ?", *(["%#{term}%"]*6))
  }

  def has_active_request?
    self.alt_requests.pending.size > 0
  end

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
