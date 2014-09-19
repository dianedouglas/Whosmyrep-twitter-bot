class Tweet < ActiveRecord::Base

  def check_mentions
      @senators = { "OR" => "Oregon Information", "CA" => "California Information"}


      client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'LDNk55uXbOoG1f4ZCvFspZW9l'
      config.consumer_secret = 'xlpFEIl8SkFgViLDwQe2b3yJ7clLCBsgNaxDOp1Q7wmpQuknqC'
      config.access_token = '150020012-5V4DUTwu9xJ6aF3ZY6mK0MdHLVMNKnSuXlRVA1IA'
      config.access_token_secret = 'w0x56NiADq4fTuVtG8nsFYKL1BIwxUtx8x0ce9zO4KG9L'
      end

      mentions = client.mentions_timeline

      mentions.each do |mention|
        if mention.hashtags != []
          mention.hashtags.each do |hash|
            if @senators.include?(hash.attrs[:text])
              begin
                client.update("Hey @" + mention.user.screen_name + " " + @senators[hash.attrs[:text]], :in_reply_to_status_id => mention.id)
              rescue
                client.update("Hey @" + mention.user.screen_name + " " + @senators[hash.attrs[:text]] + Time.now.to_s, :in_reply_to_status_id => mention.id)
              end
            end
          end
        end
      end
  end
end
