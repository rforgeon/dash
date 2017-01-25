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

  def find_with_token(token)
    @user = User.find_by(
    tokens: token
    )
    return @user
  end

  def set_user(user)
    auth = request.env['omniauth.auth']

    user.lyft_token = auth['credentials']['token'],
    user.lyft_refresh_token = auth['credentials']['refresh_token'],
    user.lyft_expires_at = auth['credentials']['expires_at']

  end


  def redirect_callbacks
    binding.pry
    #redirect_to :controller => :user_identities, :action => :index

    #create user Identity
    @auth = request.env['omniauth.auth']
    @token = request.env['omniauth.params']['state']

    @user = find_with_token(@token)

    render json: @token
    #redirect_to "http://localhost:3001"

    end



end
