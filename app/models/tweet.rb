class Tweet < ApplicationRecord
  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.secrets.twitter_consumer_key
    config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
  end

  def self.get_tweets(topic)
    @@client.search("##{topic} -rt").take(3)
  end
end
