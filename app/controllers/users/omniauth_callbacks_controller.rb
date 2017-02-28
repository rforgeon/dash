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
    origin_url = request.env['omniauth.params']['auth_origin_url']
    # @client = request.env['omniauth.params']['client']
    # @id = request.env['omniauth.params']['id']
    #
    # @user = User.find(@id)
    # @userCheck = @user.tokens.values.any? { @client }
    #
    # if @userCheck

      #set_user(@user)
      auth = request.env['omniauth.auth']
      lyft_token = auth['credentials']['token']
      # @user.lyft_refresh_token = auth['credentials']['refresh_token'],
      # @user.lyft_expires_at = auth['credentials']['expires_at']
      #
      # @user.save

      #trimmedToken = lyft_token.split(',')[0][2..-2]
      # @user.lyft_token = trimmedToken
      #
      # @user.save

      binding.pry

      if origin_url == 'http://mytopstop.com/'
        redirect_to "#{origin_url}?token=#{lyft_token}"

      else
        redirect_to "#{origin_url}&token=#{lyft_token}"

      end

    # else
    #   render json: "Access Denied"
    # end


    end



end
