class LyftAuthsController < ApplicationController
  before_action :set_lyft_auth, only: [:show, :update, :destroy]

  require 'net/http'
  require 'uri'
  require 'json'

  # GET /lyft_auths
  def index
    @lyft_auths = LyftAuth.all

    render json: @lyft_auths
  end

  # GET /lyft_auths/1
  def show
    render json: @lyft_auth
  end



  # POST /lyft_auths
  def create
    @lyft_auth = LyftAuth.new(lyft_auth_params)

      ##contact Lyft for an auth code
      uri = URI.parse("https://api.lyft.com/oauth/authorize")
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(LYFT_CLIENT_ID, LYFT_CLIENT_SECRET)
      request.content_type = "application/json"
      request.body = JSON.dump({
        "grant_type" => "client_credentials",
        "scope" => "public, rides.read, offline"
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      authResponse = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      render json: authResponse
      # response.code
      # response.body

      #check response codes before proceeding

      # if authResponse.code == 400
      #   #throw error invalid_request or unsupported_grant_type
      #   render json: @lyft_auth.errors, status: :unprocessable_entity
      #
      # elsif authResponse.code == 401
      #   #throw error invalid_client
      #   render json: @lyft_auth.errors, status: :unprocessable_entity
      #
      # elsif authResponse.code == 200
        #Use access token to allow requests from Lyft

        uri = URI.parse("https://api.lyft.com/oauth/token")
        request = Net::HTTP::Post.new(uri)
        request.basic_auth(LYFT_CLIENT_ID, LYFT_CLIENT_SECRET)
        request.content_type = "application/json"
        request.body = JSON.dump({
          "grant_type" => "authorization_code",
          "code" => "authResponse.code"
        })

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        tokenResponse = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        # response.code
        # response.body

        @lyft_auth.token = tokenResponse.body.access_token
        # @lyft_auth.refreshToken = tokenResponse.body.refresh_token
        # tokenResponse.code
        render json: tokenResponse.body

      #end


    if @lyft_auth.save
      render json: @lyft_auth, status: :created, location: @lyft_auth
    else
      render json: @lyft_auth.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /lyft_auths/1
  def update
    if @lyft_auth.update(lyft_auth_params)
      render json: @lyft_auth
    else
      render json: @lyft_auth.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lyft_auths/1
  def destroy
    @lyft_auth.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyft_auth
      @lyft_auth = LyftAuth.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lyft_auth_params
      params.permit(:token)
    end
end
