class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # include DeviseTokenAuth::Concerns::SetUserByToken
  #
  # before_action :authenticate_user!

  def lyft
    binding.pry
  end

  def failure
    binding.pry
  end

  def omniauth_success
    binding.pry

  end

  def trimmed_token
    token = request.env['omniauth.auth']['credentials']['token']
    return token.slice!(2..334)
  end

  def set_user(user)
    binding.pry
    auth = request.env['omniauth.auth']
    user.lyft_token = auth['credentials']['token'],
    user.lyft_refresh_token = auth['credentials']['refresh_token'],
    user.lyft_expires_at = auth['credentials']['expires_at']

    user.save
  end


  def redirect_callbacks

    # #create user Identity
    # @origin_url = request.env['omniauth.params']['auth_origin_url']
    # @client = request.env['omniauth.params']['client']
    # @id = request.env['omniauth.params']['id']
    #
    # @user = User.find(@id)
    # @userCheck = @user.tokens.values.any? { @client }
    #
    # if @userCheck
    #
    #   #set_user(@user)
    #   auth = request.env['omniauth.auth']
    #   @user.lyft_token = auth['credentials']['token'],
    #   @user.lyft_refresh_token = auth['credentials']['refresh_token'],
    #   @user.lyft_expires_at = auth['credentials']['expires_at']
    #
    #   @user.save
    #
    #   trimmedToken = @user.lyft_token.split(',')[0][2..-2]
    #   @user.lyft_token = trimmedToken
    #
    #   @user.save
    #
    #   redirect_to @origin_url
    #
    # else
    #   render json: "Access Denied"
    # end

    auth = request.env['omniauth.auth']
    origin_url = request.env['omniauth.params']['auth_origin_url']
    lyft_token = auth['credentials']['token']
    uid = auth['credentials']['uid']
    trimmedToken = lyft_token.split(',')[0][2..-2]

    redirect_url = `#{origin_url}dashboard/#{trimmedToken}`

    token_example = "AAAABYl3lLCwkBr7MQPpV0UsXqK1CNKDO0Q5jD3YhUp1JTEewceepsWK7hm7ArX7jJgt1xYDban7-Wb5B08diXJGiC6bhfRy4hVcD0Y3yEtt6T1PtorIvz5gQch3nNSdDyhi1HM00dZ4vTegf6w0JsLmJSRlDT2lyZd9wA4PXS3BesOzIJ7uS-YaiZZP1xHp9DGdkjPoZSU8tc-FIk9K4JBtRlKKkwtQcnQ3ed9nQBMzxhYDDgP-3u3zVv07gGQ-CDGMC9hUGrsWcR2uXPfW0M7hmLV-OvZS_31rJmpdYmra_u3BEMB8_m53UKo_1xMF0STZVKz7T"

    redirect_to "http://localhost:3001/#/dashboard/#/1"



    end



end
