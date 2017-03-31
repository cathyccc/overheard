class UsersController < ApplicationController
  def show
    @tweets = if params[:query]
      Tweet.get_tweets(params[:query])
    else
      []
    end



    @twitter_auth = UserAuthentication.where(user_id: current_user.id, authentication_provider:"twitter")
    @tracked_term = TrackedTerm.new
    @tracked_terms = Tweet.find_tracked(current_user)


    @post_tweet = if params[:new_tweet]
      Tweet.post_tweet(params[:new_tweet], current_user)
    end

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
