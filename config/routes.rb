Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  resources :tracked_terms, only: [:create,:destroy]
  resources :tweets

  get 'profile', to: 'users#show'

  root "tweets#index"
end
