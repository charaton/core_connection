class User < ApplicationRecord
  has_secure_password

  attr_accessor :current_password

  has_one :profile, dependent: :destroy

  validates :password, length: {minimum:6}, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, if: :changing_password?
  validates :password_confirmation, presence: true, if: :changing_password?

  scope :pending, -> { where status: false, admin: false }
  scope :approved, -> { where status: true, admin: false }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_later
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  private

  def changing_password?
    current_password.present?
  end
end
