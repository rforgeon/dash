class Api::YelpController < ApplicationController

  require 'yelp'
  require 'json'


  def search
     lat = params['lat']
     lng = params['lng']
    coordinates = {latitude: lat, longitude: lng }
    render json: Yelp.client.search_by_coordinates(coordinates, { limit: 3, radius_filter: 30 })
  end

  def search_recs

     location = params['location']
     category = params['category']

    render json: Yelp.client.search(location, { limit: 3, term: category })

  end




end
