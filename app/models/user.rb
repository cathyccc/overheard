class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]
  has_many :tracked_terms, inverse_of: :user
  has_many :user_authentications, inverse_of: :user

  # def self.from_omniauth(auth)
  #   user.user_authentications.provider = auth.provider
  #   user.user_authentications.uid = auth.uid
  # end
end
