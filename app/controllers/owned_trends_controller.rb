class OwnedTrendsController < ApplicationController
    
    def index
        @OwnedTrends = OwnedTrend.all
    
        render json: @OwnedTrends
      end

    def show
        @OwnedTrend = OwnedTrend.find(params[:id])

        render json: @OwnedTrend
    end


    def create
        @OwnedTrend = OwnedTrend.create(trend_params)

        @user = User.find(trend_params[:user_id])
        @user.account_balance -= trend_params[:initial_valuation]
        @user.save

        if @OwnedTrend.save
          render json: @OwnedTrend, status: :created, location: @OwnedTrend
        else
          render json: @OwnedTrend.errors, status: :unprocessable_entity
        end

    end

     # DELETE /trends/1
     def destroy
        @OwnedTrend = OwnedTrend.find(params[:id])

        # @user = User.find(@OwnedTrend.user_id)
        # @user.account_balance += @OwnedTrend.current_valuation
        # @user.save

        @OwnedTrend.destroy

      end



    private

    def set_trend
        @OwnedTrend = OwnedTrend.find(params[:id])
      end

    def trend_params
        params.require(:trend).permit(:name, :url, :promoted_content, :query, :initial_tweet_volume, :initial_valuation, :initial_rank, :quantity_trends_purchased, :user_id)
      end

end
