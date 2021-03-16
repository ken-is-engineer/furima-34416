Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :items do
    member do
      resources :purchases, only: [:index, :create]
      resources :favorites, only: [:index, :create, :destroy]
    end
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
end
