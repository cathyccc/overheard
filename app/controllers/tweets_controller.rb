class TweetsController < ApplicationController
  def index
    @tweets = Tweet.get_tweets("wednesdays")
  end

end
