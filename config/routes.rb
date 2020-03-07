Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :websites
  resources :imports
  get '/search' => 'websites#search'

  root 'websites#index'

  require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'
end
