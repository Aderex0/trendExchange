require 'twitter'

class Trend < ApplicationRecord

    def self.fetch_trends
        
        client = Twitter::REST::Client.new do |config| 
            config.consumer_key         = "FR1dPBikDl9G3BCD9VSC1lyEm"
            config.consumer_secret      = "rUALnf9zDqOtFYTdBcBtmaa1rAAnhmuJgERcsjmo5MoOYL72A7"
            config.access_token         = "4046571867-QMWcslJhGF21ZgbABtqs4f1E8O07fSOKbW11oap"
            config.access_token_secret  = "xZLoJsjuboWLGdO8m8gB7U2q3JrBVtIcZdN36IfzMSnE8"
        end
    
        trends = client.trends(id = 23424975)
        trends.attrs[:trends].each_with_index{|trd, idx| trd[:rank]=idx+1 }
        trends
    end

    # Trend.fetch_trends.attrs[:trends].map.with_index{|t, idx| t[:name] idx }

end
