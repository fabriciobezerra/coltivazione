Rails.application.routes.draw do
  root 'home#index'

  resources :farms, only: %w[show new create]
end
