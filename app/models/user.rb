class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.user.email.email_regex

  has_many :images, as: :imageable, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :booking_rooms, dependent: :destroy

  validates :name, presence: true,
            length: {maximum: Settings.user.name.max_length}
  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length},
            allow_nil: true
  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private
  def downcase_email
    email.downcase!
  end
end
