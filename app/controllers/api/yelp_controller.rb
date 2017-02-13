class Api::YelpController < ApplicationController

  require 'yelp'
  require 'json'


  def search

    coordinates = {latitude: params['lat'], longitude: params['lng']}
    render json: Yelp.client.search_by_coordinates(coordinates, { limit: 3, radius_filter: 30 })
  end

  def search_recs

    render json: Yelp.client.search(params['location'], { limit: 3, term: params['category'] })

  end


end
