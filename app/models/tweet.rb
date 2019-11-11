require 'twitter'

class Tweet < ApplicationRecord

    def self.fetch_trends
        
        client = Twitter::REST::Client.new do |config| 
            config.consumer_key         = "FR1dPBikDl9G3BCD9VSC1lyEm"
            config.consumer_secret      = "rUALnf9zDqOtFYTdBcBtmaa1rAAnhmuJgERcsjmo5MoOYL72A7"
            config.access_token         = "4046571867-QMWcslJhGF21ZgbABtqs4f1E8O07fSOKbW11oap"
            config.access_token_secret  = "xZLoJsjuboWLGdO8m8gB7U2q3JrBVtIcZdN36IfzMSnE8"
        end

        client.trends(id = 23424975)
    end

end

