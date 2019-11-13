class OwnedTrendsController < ApplicationController
    

    def create
        @OwnedTrend = OwnedTrend.create(trend_params)
  
        if @OwnedTrend.save
          render json: @OwnedTrend, status: :created, location: @OwnedTrend
        else
          render json: @OwnedTrend.errors, status: :unprocessable_entity
        end

    end



    private

    def trend_params
        params.require(:trend).permit(:name, :url, :promoted_content, :query, :initial_tweet_volume, :initial_valuation, :initial_rank, :quantity_trends_purchased, :user_id)
      end

end
