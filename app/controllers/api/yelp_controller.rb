class Api::YelpController < ApplicationController

  require 'yelp'
  require 'json'
  require 'bigdecimal'


  def search

    coordinates = {latitude: params['lat'], longitude: params['lng'], accuracy: 1}
    render json: Yelp.client.search_by_coordinates(coordinates, { limit: 1, radius_filter: 10 })
  end


end
