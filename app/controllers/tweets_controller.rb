class TweetsController < ApplicationController


  def index
    @tweet = Tweet.new
    @tweet.check_mentions
  end
end

