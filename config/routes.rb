Rails.application.routes.draw do



    mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, defaults: { format: :json }
    resources :users, only: [:index, :show]
    namespace 'users' do
      resources :user_identities, only: [:create]
      get '/create_id', :to => "user_identities#create"

    end



end
