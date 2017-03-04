class UsersController < ApplicationController
  def show
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      []
    end

    @tracked_term = TrackedTerm.new
    @tracked_terms = Tweet.find_tracked(current_user)

    @yelp_businesses = if params[:q_business]
      YelpReview.get_business(params[:q_business])
    else
      []
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:query)
  end
end
