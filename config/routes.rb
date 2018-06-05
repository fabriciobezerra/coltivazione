Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :farms, only: %w[show new create] do
    resources :harvests, only: %w[show new create]
  end
end
