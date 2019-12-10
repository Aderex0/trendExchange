require 'twitter'

class Trend < ApplicationRecord

    def self.fetch_trends
        
        client = Twitter::REST::Client.new do |config| 
            config.consumer_key         = "Key"
            config.consumer_secret      = "Key"
            config.access_token         = "Key"
            config.access_token_secret  = "Key"
        end
    
        trends = client.trends(id = 23424975)
        trends.attrs[:trends].each_with_index{|trd, idx| trd[:rank]=idx+1 }
        trends
    end

    # Trend.fetch_trends.attrs[:trends].map.with_index{|t, idx| t[:name] idx }

end
