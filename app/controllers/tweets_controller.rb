class TweetsController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'LDNk55uXbOoG1f4ZCvFspZW9l'
    config.consumer_secret = 'xlpFEIl8SkFgViLDwQe2b3yJ7clLCBsgNaxDOp1Q7wmpQuknqC'
    config.access_token = '150020012-5V4DUTwu9xJ6aF3ZY6mK0MdHLVMNKnSuXlRVA1IA'
    config.access_token_secret = 'w0x56NiADq4fTuVtG8nsFYKL1BIwxUtx8x0ce9zO4KG9L'
    end
    @tweets = []
    mentions = client.mentions_timeline
    mentions.each do |tweet|
      user = '@' + tweet.user.username
      client.update("Hello " + user + "!")
      @tweets << user
    end
    # binding.pry
    # topics = ["whosmyrep"]


    # @mentions = client.filter(:track => client) do |object|
    #   puts object.text if object.is_a?(Twitter::Tweet)
    # end
  end
end

