class TrackedTermsController < ApplicationController
  def create
    @tracked_term = TrackedTerm.new(tracked_term_params)
    @tracked_term.user = current_user
    if @tracked_term.save
      redirect_to profile_path
    else
      @tweets = if params[:query]
        Tweet.get_tweets(params[:query])
      else
        []
      end
      @tracked_terms = Tweet.find_tracked(current_user)
      render "users/show"
      # flash[:notice] = "Sorry, you are only allowed to track a maximum of 3 entries."
    end
  end

  def destroy
    @tracked_term = TrackedTerm.find(params[:id])
    @tracked_term.destroy
    redirect_to profile_path
  end

  private
  def tracked_term_params
    params.require(:tracked_term).permit(:term)
  end
end
