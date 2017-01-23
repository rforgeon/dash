class UserIdentitiesController < ApplicationController


  def index
    identidies = []
    @all = UserIdentity.all
       @all.each do |identity|
         if identity.user == current_user
           identities << identity # show user's identities
         end
    @identities = identities
  end

  def create

    render json: current_user

  # auth = request.env['omniauth.auth']
  # # Find an identity here
  # @user_identity = UserIdentity.find_with_omniauth(auth)
  #
  # if @user_identity.nil?
  #   # If no identity was found, create a brand new one here
  #   @user_identity = UserIdentity.create_with_omniauth(auth)
  # end
  #
  # if signed_in?
  #   if @user_identity.user == current_user
  #     # User is signed in so they are trying to link an identity with their
  #     # account. But we found the identity and the user associated with it
  #     # is the current user. So the identity is already associated with
  #     # this user. So let's display an error message.
  #     render json: "Already linked that account!"
  #   else
  #     # The identity is not associated with the current_user so lets
  #     # associate the identity
  #     @user_identity.user = current_user
  #     @user_identity.save
  #     render json: "Successfully linked that account!"
  #   end
  # else
  #   # No user associated with the identity so we need to create a new one
  #   #redirect_to new_user_url
  #   render json: "No user associated with the identity. Please finish registering"
  # end


  end

end
