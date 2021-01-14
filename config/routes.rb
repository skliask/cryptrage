require 'sidekiq/web'

Rails.application.routes.draw do
  get 'margins/index'
  mount Sidekiq::Web => '/sidekiq'
  resources :markets, only: [:index]
  root "margins#index"
end
