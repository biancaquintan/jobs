Rails.application.routes.draw do
  root 'profiles#show', to: 'profiles#show'
  resources :posts
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
