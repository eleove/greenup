class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :locations, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_participants, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true

  after_create :send_welcome_email

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
            username: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
             # remote_avatar_url: access_token['info']['image']
          )
      end
      user
  end

  def password_required?
    false
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
