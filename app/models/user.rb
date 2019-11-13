class User < ApplicationRecord
    has_many :owned_trends
    has_secure_password
    
    def portfolio_valuation

        owned_trends = self.owned_trends
            #own portfolio of trends; data from purchase

        current_trends = Trend.fetch_trends.attrs[:trends]
            #fetch get the up-to-date trend data

        evaluated_trends = owned_trends.each{|own_trd|

                current_trend = current_trends.select{|curr_trd| 
                    curr_trd[:name] == own_trd[:name]}
                        # current_trend format: {:name=>"#wreathgate", :url=>"http://twitter.com/search?q=%23wreathgate", :promoted_content=>nil, :query=>"%23wreathgate", :tweet_volume=>11908, :rank=>2}

                    incorporate_rank_valuation(current_trend, own_trd)
                        
                    incorporate_volume_valuation(current_trend, own_trd)

                    generate_change_percent_valuation(own_trd)
                    
                own_trd
                        }

        evaluated_trends

    end

    def incorporate_rank_valuation(current_trend, own_trd)

        if current_trend == []

            own_trd[:current_rank] = 0
            own_trd[:current_valuation] = 0
        else
            rank_change = own_trd[:initial_rank] - current_trend[0][:rank]
            
            own_trd[:current_rank] = current_trend[0][:rank]
            own_trd[:current_valuation] = own_trd[:initial_valuation]+0.1*rank_change
        end
    end


    def incorporate_volume_valuation(current_trend, own_trd)
        if current_trend==[]
            own_trd[:current_tweet_volume]=nil
        elsif current_trend[0][:tweet_volume]==nil
            own_trd[:current_tweet_volume]=nil
        else
            own_trd[:current_tweet_volume] = current_trend[0][:tweet_volume]

            volume_increase_integer = own_trd[:current_tweet_volume] - own_trd[:initial_tweet_volume]
            own_trd[:change_percent_volume] = volume_increase_integer*100 / own_trd[:initial_tweet_volume]

            # own_trd[:valuation] = own_trd[:valuation].to_i*volume_increase*0.1
        end
    end

    def generate_change_percent_valuation(own_trd)
        diff = own_trd[:current_valuation] - own_trd[:initial_valuation]
        own_trd[:change_percent_valuation] = diff / own_trd[:initial_valuation] *100
    end




    def incorporate_time_valuation(current_trend, own_trd)

        # initial_time = own_trd[:created_at].split(/['T','.']/)[1]
            #expected => "10:34:15"

        # current_date_time = "#{Time.new}"
        # current_time = current_date_time.split(/[' ']/)[1]
            #expected => "16:14:13"

        tot_holding_minutes(current_time, initial_time)
    end

    def tot_holding_minutes(current_time, initial_time)
        #expected format => "16:14:13"

        hours = current_time.split(':')[0].to_i - initial_time.split(':')[0].to_i
                #note; does not account for 24 vs 0 
        minutes = current_time.split(':')[1].to_i - initial_time.split(':')[1].to_i

        total_minutes = hours*60+minutes

        total_minutes
    end

    def tot_volume_increase(current_trend, own_trd)
        if current_trend==[]
            own_trd[:tweet_volume]=nil
        elsif current_trend[0][:tweet_volume]==nil
            own_trd[:tweet_volume]=nil
        else
            volume_increase = own_trd[:tweet_volume] - current_trend[:tweet_volume]
            own_trd[:valuation] = own_trd[:valuation]*volume_increase*0.1
        end
    end

end
