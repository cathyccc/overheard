Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get '/auth/:provider/callback', to: 'sessions#create'

  resources :tweets

  get 'profile', to: 'users#show'

  root "tweets#index"
end
