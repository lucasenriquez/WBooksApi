class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, 
         jwt_revocation_strategy: JwtBlacklist
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many  :rents
  has_many  :book_suggestions

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.new(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
    end
    user
  end
end
