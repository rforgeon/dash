Rails.application.routes.draw do
  resources :lyft_auths
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    devise_for :users
    resources :lyft_auths
    #/lyft_auths



end
