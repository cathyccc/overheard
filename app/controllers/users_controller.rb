class UsersController < ApplicationController
  def show
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      []
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:query)
  end
end
