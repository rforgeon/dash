Rails.application.routes.draw do




  devise_for :users, :controllers => { :sessions => 'users/sessions'}, defaults: { :format => 'json' }

  #get 'users' do
      resources :user_identities, only: [:create]
      get '/create_id', :to => "user_identities#create"
  #end



end
