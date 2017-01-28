class Api::MetricsController < ApplicationController


  def ride_metric
    #metrics = LyftMetric.all

    render json: params
  end


end
