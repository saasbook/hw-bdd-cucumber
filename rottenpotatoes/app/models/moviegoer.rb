class Moviegoer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |moviegoer|
      moviegoer.email = auth.info.email
      moviegoer.password = Devise.friendly_token[0,20]
      moviegoer.full_name = auth.info.name
      moviegoer.avatar_url = auth.info.image
    end
  end
end
