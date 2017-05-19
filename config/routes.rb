Rails.application.routes.draw do
  resources :entries, only: [:index]
  resources :feeds
  resources :categories

  root 'entry#index'
end
