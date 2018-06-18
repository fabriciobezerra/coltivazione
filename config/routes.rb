Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :farms, only: %w[index show new create] do
    resources :harvests, only: %w[index show new create]
  end
end
