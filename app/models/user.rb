class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :comments

  def self.from_google(u)
  create_with(uid: u[:uid], provider: 'google',
              password: Devise.friendly_token[0, 20],
              first_name: u[:first_name],
              last_name: u[:last_name])
             .find_or_create_by!(email: u[:email])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
