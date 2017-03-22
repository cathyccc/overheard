class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]
  has_many :tracked_terms, inverse_of: :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   # user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

    end
  end


  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.secrets.consumer_key
    config.consumer_secret     = Rails.application.secrets.consumer_secret
  end

  def self.get_tweets(topic)
    @@client.search("#{topic}", result_type: "recent").take(5)
  end

  def self.post_tweets(tweet, token, secret)
    @@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
    @@client.update("#{tweet}")
  end

end
