class TweetsController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'x2aMFVJzesaeguMp0uJ224WBJ'
    config.consumer_secret = 'Tm7N7LP1sPBNDUIdQSpswfEgTWAidH83T1r5t4FO1fzZm9Gwod'
    config.access_token = '150020012-4hL0oIa1EBTpFOm8fMuBsWUWXGK0FD0H9sKuuQG7'
    config.access_token_secret = 'mFGxqNFPYmh0Vkom2ernzpcuOzpIEblyV7JAswJ6BA7KS'
    end
    @mentions = client.mentions_timeline
  end

end

