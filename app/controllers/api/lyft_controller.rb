class Api::LyftController < ApplicationController

  #before_action :authenticate_user!

#   def show(params)
#     @lyft_identity = User.find params[:id]
#     token = (@lyft_identity.lyft_token).to_s
#     render json: {'access-token':token}
#    end
# {term: 'all', latitude: params['lat'],longitude: params['lng'], limit: 1 }

end
