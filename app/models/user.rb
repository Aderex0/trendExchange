class User < ApplicationRecord
    has_many :owned_trends
    has_secure_password
    
    def portfolio_valuation

        owned_trends = self.owned_trends

        current_trends = Trend.fetch_trends.attrs[:trends]
        # current_trends = Trend.fetch_trends.attrs[:trends][0][:rank]

        evaluated_trends = owned_trends.each{|own_trd|
                
            current_trend = current_trends.select{|curr_trd| 
                curr_trd[:name] == own_trd[:name]}
                # current_trend is correct, format: {:name=>"#wreathgate", :url=>"http://twitter.com/search?q=%23wreathgate", :promoted_content=>nil, :query=>"%23wreathgate", :tweet_volume=>11908, :rank=>2}
           
                rank_change = own_trd[:initial_rank] - current_trend[0][:rank]
                own_trd[:current_rank] = current_trend[0][:rank]

                volume_change = 10000
                # if volume == nil 
                #                     new_volume -= 1000 
                #                 else 
                #                     new_volume -= volume
                #                 end
                # account for nil possibility
                
                # own_trd[:rank_change] = rank_change
                # rank_change*1000 + volume_change*0,001

                own_trd[:valuation] += 0.1*rank_change
                own_trd
        }

        evaluated_trends

    end

end
