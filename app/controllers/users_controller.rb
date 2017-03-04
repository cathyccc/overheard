class UsersController < ApplicationController
  def show
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      []
    end

    @tracked_term = TrackedTerm.new
    @tracked_terms = Tweet.find_tracked(current_user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:query)
  end
end
