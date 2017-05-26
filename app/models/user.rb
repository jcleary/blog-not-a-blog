class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  after_initialize :default_values
   
  def to_param
    username
  end

  has_many :collections, dependent: :destroy
  has_many :artifacts, dependent: :destroy

  validates :username, presence: true

  def default_values
    self.username ||= rand(36**12).to_s(36)
  end

end
