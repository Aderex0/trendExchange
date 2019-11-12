class TrendsController < ApplicationController
    before_action :set_trend, only: [:show, :update, :destroy]

    # GET /Trends
    def index
      @Trends = Trend.fetch_trends
  
      render json: @Trends
    end
  
    # GET /Trends/1
    def show
      render json: @Trends
    end
  
    # POST /Trends
    def create
      @Trends = Trend.new(trend_params)
  
      if @Trend.save
        render json: @Trend, status: :created, location: @Trend
      else
        render json: @Trend.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /trends/1
    def update
      if @Trend.update(trend_params)
        render json: @Trend
      else
        render json: @Trend.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /trends/1
    def destroy
      @Trend.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_trend
        @Trend = Trend.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def trend_params
        params.require(:trend).permit(:name, :url, :promoted_content, :query, :trend_volume)
      end

end
