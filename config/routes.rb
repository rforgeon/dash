Rails.application.routes.draw do


    namespace 'api' do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, defaults: { format: :json }
      resources :users, only: [:index, :show]

      scope '/metrics', :controller => :metrics do
        post :ride_metric
      end

      scope '/hooks', :controller => :hooks do
        post :ride_event_callback
      end

    end


end
