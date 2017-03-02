class Tweet < ApplicationRecord
  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Figaro.env.twitter_consumer_key
    config.consumer_secret     = Figaro.env.twitter_consumer_secret
  end

  def self.get_tweets(topic)
      @@client.search("#{topic} -rt", lang:'en').take(3)
  end

  def self.find_tracked(current_user)
    @tracked_terms = TrackedTerm.where(user_id: current_user)
  end

end
