Rails.application.routes.draw do
  get 'home/index'

  devise_for :users do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  resources :tweets

  get 'profile', to: 'users#show'

  root "tweets#index"
end
