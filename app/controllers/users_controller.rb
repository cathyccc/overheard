class UsersController < ApplicationController
  def show
    @tweet = Tweet.get_tweets("toronto")
  end
end
