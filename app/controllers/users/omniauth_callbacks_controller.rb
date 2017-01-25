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

  def set_user(user)
    auth = request.env['omniauth.auth']

    user.lyft_token = auth['credentials']['token'],
    user.lyft_refresh_token = auth['credentials']['refresh_token'],
    user.lyft_expires_at = auth['credentials']['expires_at']

    user.save
  end


  def redirect_callbacks
    binding.pry

    #create user Identity
    @origin_url = request.env['omniauth.params']['auth_origin_url']
    @client = request.env['omniauth.params']['client']
    @id = request.env['omniauth.params']['id']

    @user = User.find(@id)
    @userCheck = @user.tokens.values.any? { @client }

    if @userCheck

      set_user(@user)
      redirect_to @origin_url

    else
      render json: "Access Denied"
    end


    end



end
