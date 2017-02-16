class TweetsController < ApplicationController
  before_action :get_tweets
  def index
    @tweets = @client.search("#overheard").take(2)
  end

  private
  def get_tweets
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
    end
  end
end
