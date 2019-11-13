class ApplicationController < ActionController::API

    def decode_token
    end

    def issue_token(data)
        JWT.encode(data, secret)
    end

    def secret
        "trendExchange01"    
    end
    # echo SECRET="secretpassword" in bash console
end
