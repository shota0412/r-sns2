class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show]
  def index
    @tweet = Tweet.all.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
     @tweet = Tweet.new(tweet_params)
     @tweet.user_id = current_user.id
     @tweet.save
     redirect_to tweet_path(@tweet)
  end

  def show
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
