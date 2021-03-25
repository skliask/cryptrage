require 'sidekiq/web'

Rails.application.routes.draw do
  get 'triangles/index'
  mount Sidekiq::Web => '/sidekiq'
  resources :markets
  resources :margins, only: [:index]
  resources :triangles, only: [:index]
  resources :rates, only: [:index]
  root "markets#index"
end
