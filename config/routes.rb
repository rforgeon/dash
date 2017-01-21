Rails.application.routes.draw do

  namespace :api do
    devise_for :users
    resources :user_identities, only: [:create]
    #get '/create_id', :to => "user_identities#create"
  end



end
