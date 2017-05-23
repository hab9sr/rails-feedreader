Rails.application.routes.draw do
  resources :entries, only: [:index]
  get 'refresh', to: 'entry#refresh', as: 'refresh_feeds'
  resources :feeds
  resources :categories

  root 'entry#index'
end
