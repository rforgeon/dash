class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!

  def lyft
    binding.pry
  end

  def failure
    binding.pry
  end

  def omniauth_success
    binding.pry

    #create user Identity
    @auth = request.env['omniauth.auth']

    render json: @auth

  end


  def redirect_callbacks
    #binding.pry
    #redirect_to :controller => :user_identities, :action => :index


    #create user Identity
    @auth = request.env['omniauth.auth']

    render json: current_user
    #redirect_to "http://localhost:3001"

   #
  #   #Find an identity here
  #   @user_identity = UserIdentity.find_with_omniauth(@auth)
   #
  #   if @user_identity.nil?
  #     # If no identity was found, create a brand new one here
  #     @user_identity = UserIdentity.create_with_omniauth(@auth)
  #   end
   #
  #   if profile_signed_in?
  #     if @user_identity.user == current_user
  #       # User is signed in so they are trying to link an identity with their
  #       # account. But we found the identity and the user associated with it
  #       # is the current user. So the identity is already associated with
  #       # this user. So let's display an error message.
  #       render json: "Already linked that account!"
  #     else
  #       # The identity is not associated with the current_user so lets
  #       # associate the identity
  #       @user_identity.user = current_user
  #       @user_identity.save
  #       render json: "Successfully linked that account!"
  #     end
  #   else
  #     # No user associated with the identity so we need to create a new one
  #     #redirect_to new_user_url
  #     render json: "No user associated with the identity. Please finish registering"
  #   end
   #
  #   render json: @user_identity
   #
    end



end
