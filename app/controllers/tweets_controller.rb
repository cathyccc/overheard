class TweetsController < ApplicationController
  def index
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      []
    end

    @yelp = YelpReview.get_business.businesses[0]
  end

  private
  def tweet_params
    params.require(:tweet).permit(:query)
  end

end
