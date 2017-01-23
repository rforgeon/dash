Rails.application.routes.draw do

    devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }, :defaults => { :format => :json }
    resources :user_identities, only: [:create]
    #get '/create_id', :to => "user_identities#create"


end
