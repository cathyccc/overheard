class TweetsController < ApplicationController
  def index
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      Tweet.get_tweets("toronto")
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:query)
  end

end
