class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  has_secure_password :validations => false
  after_create :init_settings

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}

  validates :password,  length: { minimum: 6 },
                        allow_blank: true

  has_one :profile, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_many :alts, dependent: :destroy
  has_many :alt_requests, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :news, dependent: :destroy

  accepts_nested_attributes_for :profile

  scope :search, -> (term) {
    joins("INNER JOIN profiles p on users.id = p.user_id").
    where("users.name LIKE ? or users.email LIKE ? or p.firstname LIKE ? or p.lastname LIKE ? or p.wow_region LIKE ? or p.wow_server LIKE ? or p.phone LIKE ?", *(["%#{term}%"]*7))
  }

  def init_settings
    setting = Setting.new(user_id: self.id, locale: 0)
    setting.save!
  end

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

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
