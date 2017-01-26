class Api::MetricsController < ApplicationController


  def show
    metrics = Lyft_Metric.all

    render json: metrics
  end


end
